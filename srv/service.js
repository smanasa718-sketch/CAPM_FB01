import cds from "@sap/cds";
import { getJournalEntrySoapClient } from "./lib/soap-service.js";
import axios from "axios";


export default cds.service.impl(async function () {
    console.log("ZFI service implementation loaded");

    const remote = await cds.connect.to("D4L");

    this.on("READ", "A_JournalEntryItemBasic", async (req) => {
        console.log("Forwarding READ to D4L:", req.query);

        const result = await remote.run(req.query);

        console.log("D4L returned:", result?.length, "records");
        return result;
    });

    this.on("runJournalEntryJob", async (req) => {
        console.log("ZFI scheduled job started");

        const result = await remote.send({
            method: "GET",
            path: "/A_JournalEntryItemBasic?$top=5"
        });

        const count = Array.isArray(result) ? result.length : 0;

        console.log("D4L returned:", count, "records");

        console.log("Records retrieved from D4L:");
        console.log(JSON.stringify(result, null, 5));

        //return `ZFI job completed. Records retrieved: ${count}`;
        return JSON.stringify({
                    message: "ZFI job completed",
                   count: count,
                    records: result
                  });
    });


    
const JOB_NAME = "ScheduleCAPMjob";
const JOB_REPEAT_INTERVAL = "10 hours";

// Read credentials from the bound Cloud Foundry service instance.
function getJobSchedulerCredentials() {
  const vcap = JSON.parse(process.env.VCAP_SERVICES || "{}");
  const bindings = vcap.jobscheduler || [];

  const binding = bindings.find(
    (item) => item.name === "jobSchedulingService"
  );

  if (!binding) {
    throw new Error(
      'The "jobSchedulingService" binding was not found.'
    );
  }

  const credentials = binding.credentials;

  if (
    !credentials?.url ||
    !credentials?.uaa?.url ||
    !credentials?.uaa?.clientid ||
    !credentials?.uaa?.clientsecret
  ) {
    throw new Error(
      "Required Job Scheduler OAuth credentials are missing."
    );
  }

  return credentials;
}

// Get an OAuth token using the bound service credentials.
async function getJobSchedulerToken(credentials) {
  const tokenUrl =
    credentials.uaa.url.replace(/\/+$/, "") + "/oauth/token";

  const basicAuth = Buffer.from(
    `${credentials.uaa.clientid}:${credentials.uaa.clientsecret}`
  ).toString("base64");

  const response = await fetch(tokenUrl, {
    method: "POST",
    headers: {
      Authorization: `Basic ${basicAuth}`,
      "Content-Type": "application/x-www-form-urlencoded"
    },
    body: "grant_type=client_credentials"
  });

  if (!response.ok) {
    throw new Error(
      `OAuth token request failed with HTTP ${response.status}.`
    );
  }

  const token = await response.json();

  if (!token.access_token) {
    throw new Error("OAuth response did not contain an access token.");
  }

  return token.access_token;
}

// Make an authenticated request to the Job Scheduler REST API.
async function schedulerRequest(credentials, token, path, options = {}) {
  const baseUrl = credentials.url.replace(/\/+$/, "");
  const response = await fetch(`${baseUrl}${path}`, {
    ...options,
    headers: {
      Authorization: `Bearer ${token}`,
      Accept: "application/json",
      ...(options.body ? { "Content-Type": "application/json" } : {}),
      ...options.headers
    }
  });

  const responseText = await response.text();

  if (!response.ok) {
    // Avoid logging credentials or access tokens.
    throw new Error(
      `Job Scheduler API returned HTTP ${response.status}: ` +
      responseText.slice(0, 500)
    );
  }

  return responseText ? JSON.parse(responseText) : {};
}

async function ensureJobIsScheduled(req) {
  const credentials = getJobSchedulerCredentials();
  const token = await getJobSchedulerToken(credentials);

  // Look up the existing job and include its schedules.
  const query = new URLSearchParams({
    name: JOB_NAME,
    displaySchedules: "true"
  });

  const result = await schedulerRequest(
    credentials,
    token,
    `/scheduler/jobs?${query.toString()}`
  );

  // The name lookup normally returns one job object.
  const job = Array.isArray(result)
    ? result.find((item) => item.name === JOB_NAME)
    : result?.name === JOB_NAME
      ? result
      : Array.isArray(result?.jobs)
        ? result.jobs.find((item) => item.name === JOB_NAME)
        : undefined;

  if (!job) {
    throw new Error(
      `Job "${JOB_NAME}" was not found. Create it in the Job Scheduler dashboard first.`
    );
  }

  if (job.active !== true) {
    return `Job "${JOB_NAME}" exists but is inactive. Activate it in the Job Scheduler dashboard first.`;
  }

  const schedules = Array.isArray(job.schedules)
    ? job.schedules
    : [];

  const activeSchedule = schedules.find(
    (schedule) => schedule.active === true
  );

  if (activeSchedule) {
   // req.notify(
   //     `Job "${JOB_NAME}" is already scheduled. No duplicate schedule was created.`
   // );

    return `Job "${JOB_NAME}" is already scheduled. No duplicate schedule was created.`;
}

  const jobId = job._id ?? job.jobId ?? job.id;

  if (jobId === undefined || jobId === null) {
    throw new Error("The Job Scheduler response did not contain a job ID.");
  }

  // Create a schedule for the EXISTING job, not a new job.
  await schedulerRequest(
    credentials,
    token,
    `/scheduler/jobs/${encodeURIComponent(String(jobId))}/schedules`,
    {
      method: "POST",
      body: JSON.stringify({
        repeatInterval: JOB_REPEAT_INTERVAL,
        active: true,
        description: "CAP-created schedule"
      })
    }
  );

  return `A schedule was created for "${JOB_NAME}" with a repeat interval of ${JOB_REPEAT_INTERVAL}.`;
}


let scheduleRequestInProgress;

this.on("scheduleJournalEntryJob", async (req) => {
  // Reuse an in-flight request if the user clicks repeatedly.
  if (scheduleRequestInProgress) {
    return scheduleRequestInProgress;
  }

  scheduleRequestInProgress = ensureJobIsScheduled(req);

  try {
     const result = await scheduleRequestInProgress;
     if(result)
     {
       req.notify(result);
     }
     return result;
    //return await scheduleRequestInProgress;
  } catch (error) {
    console.error("Schedule Job failed:", error.message);

    return req.error(
      502,
      "Could not verify or create the job schedule. Check the CAP server logs and Job Scheduler service binding."
    );
  } finally {
    scheduleRequestInProgress = undefined;
  }
});


this.on("postJournalEntry", async (req) => {
  try {
    const { payload } = req.data;

    if (!payload) {
      return req.error(400, "A journal-entry payload is required.");
    }

    let journalEntryRequest;

    try {
      journalEntryRequest = JSON.parse(payload);
    } catch {
      return req.error(400, "The payload must be valid JSON.");
    }

    if (
      !journalEntryRequest ||
      !journalEntryRequest.MessageHeader ||
      !Array.isArray(journalEntryRequest.JournalEntryCreateRequest) ||
      journalEntryRequest.JournalEntryCreateRequest.length === 0
    ) {
      return req.error(
        400,
        "Payload must contain MessageHeader and a non-empty JournalEntryCreateRequest array."
      );
    }

    const { client, endpointUrl } =
      await getJournalEntrySoapClient();

    console.log("Calling S/4HANA journal-entry SOAP endpoint.");

    const [result] =
      await client.JournalEntryCreateRequestConfirmation_InAsync(
        journalEntryRequest
      );

    console.log("S/4HANA SOAP response received.");

    return JSON.stringify({
      endpoint: endpointUrl,
      response: result
    });
 } /*catch (error) {
    console.error(
     "Journal-entry SOAP call failed:",
     error.message
     );

    return req.error(
      502,
        "The S/4HANA journal-entry SOAP request failed. Check the CAP logs for details."
       );
    } */
    catch (error) {
  console.error("SOAP call failed:", error.message);
  console.error("HTTP status:", error.response?.status);
  console.error("Response body:",
    typeof error.response?.data === "string"
      ? error.response.data.slice(0, 3000)
      : JSON.stringify(error.response?.data ?? null)
  );
  console.error("Response headers:", error.response?.headers);
  console.error("Error stack:", error.stack);

  return req.error(
    502,
    "The S/4HANA journal-entry SOAP request failed. Check CAP logs."
  );
}
});
    




const JOB_ID = process.env.JOB_SCHEDULER_JOB_ID;
const SCHEDULE_ID = process.env.JOB_SCHEDULER_SCHEDULE_ID;

function getJobSchedulerCredentials() {
    const vcap = JSON.parse(process.env.VCAP_SERVICES || "{}");

    const schedulerServices = vcap.jobscheduler || [];

    if (!schedulerServices.length) {
        throw new Error(
            "Job Scheduler service is not bound to this application"
        );
    }

    return schedulerServices[0].credentials;
}

// Step 1: Get OAuth access token
async function getAccessToken(credentials) {
    const uaa = credentials.uaa;

    if (!uaa || !uaa.clientid || !uaa.clientsecret || !uaa.url) {
        throw new Error(
            "XSUAA client credentials are missing from Job Scheduler binding"
        );
    }

    const tokenUrl =
        `${uaa.url.replace(/\/$/, "")}/oauth/token`;

    const response = await axios.post(
        tokenUrl,
        new URLSearchParams({
            grant_type: "client_credentials"
        }).toString(),
        {
            auth: {
                username: uaa.clientid,
                password: uaa.clientsecret
            },
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            timeout: 30000
        }
    );

    return response.data.access_token;
}

// Step 2: Retrieve Job Scheduler execution logs
async function getRunLogs(credentials, accessToken) {
    const schedulerUrl = credentials.url.replace(/\/$/, "");

    const logsUrl =
        `${schedulerUrl}/scheduler/jobs/${encodeURIComponent(JOB_ID)}` +
        `/schedules/${encodeURIComponent(SCHEDULE_ID)}/runs`;

    const response = await axios.get(logsUrl, {
        headers: {
            Authorization: `Bearer ${accessToken}`,
            Accept: "application/json"
        },
        params: {
            page_size: 200
        },
        timeout: 30000
    });

    return response.data.results || [];
}

// Step 3: Parse the scheduler's runText
/*function parseRunText(runText) {
    if (!runText) {
        return {
            message: "No response text available",
            count: 0,
            records: []
        };
    }

    let result;

    try {
        result = JSON.parse(runText);
    } catch (error) {
        return {
            message: runText,
            count: 0,
            records: []
        };
    }

    // Handle an OData primitive response wrapper:
    // {"value":"{\"message\":\"...\",\"records\":[]}"}
    if (result && typeof result.value === "string") {
        try {
            result = JSON.parse(result.value);
        } catch (error) {
            return {
                message: result.value,
                count: 0,
                records: []
            };
        }
    }

    return result;
}*/
function parseRunText(runText) {
    let result = typeof runText === "string"
        ? JSON.parse(runText)
        : runText;

    // Extract the response from the successful scheduler event.
    if (Array.isArray(result)) {
        const success = result
            .slice()
            .reverse()
            .find(entry =>
                entry.type === "SUCCESS" && entry.text
            );

        if (!success) {
            throw new Error(
                "No successful response found in the scheduler run log"
            );
        }

        result = typeof success.text === "string"
            ? JSON.parse(success.text)
            : success.text;
    }

    // Unwrap the OData String response.
    if (result && typeof result.value === "string") {
        result = JSON.parse(result.value);
    }

    if (!result || !Array.isArray(result.records)) {
        throw new Error(
            "The scheduler response does not contain a records array"
        );
    }

    return result;
}

//module.exports = cds.service.impl(async function () {
 //export default cds.service.impl(async function () {
    this.on("getLatestJobResult", async (req) => {

        try {
            if (!JOB_ID || !SCHEDULE_ID) {
                return req.error(
                    500,
                    "Job ID or Schedule ID is not configured"
                );
            }

            // Get Job Scheduler credentials
            const credentials = getJobSchedulerCredentials();

            // Get OAuth token
            const accessToken =
                await getAccessToken(credentials);

            // Retrieve execution logs
            const logs =
                await getRunLogs(credentials, accessToken);

            if (!logs.length) {
                return JSON.stringify({
                    message: "No job executions found",
                    count: 0,
                    records: []
                });
            }

            // Find the latest execution
            const latestRun = logs
                .slice()
                .sort((a, b) =>
                    new Date(b.executionTimestamp || 0) -
                    new Date(a.executionTimestamp || 0)
                )[0];

            // Parse the complete response stored in runText
           // const result = parseRunText(latestRun.runText);

          console.log("Latest run fields:", Object.keys(latestRun));

          console.log(
            "Raw runText:",
              JSON.stringify(latestRun.runText)?.slice(0, 1500)
                );

          const result = parseRunText(latestRun.runText);

          console.log("Parsed result shape:", {
              type: typeof result,
              isArray: Array.isArray(result),
              fields: result && typeof result === "object"
                    ? Object.keys(result)
                    : [],
              count: result?.count,
              recordCount: result?.records?.length
            });

            // Return latest run information and accounting records
            return JSON.stringify({
                runId: latestRun.runId,
                runStatus: latestRun.runStatus,
                runState: latestRun.runState,
                httpStatus: latestRun.httpStatus,
                executionTimestamp: latestRun.executionTimestamp,
                message: result.message || "Job execution result",
                count: result.count ?? result.records?.length ?? 0,
                records: result.records || []
            });

        } catch (error) {

            console.error(
                "Error retrieving Job Scheduler logs:",
                error.response?.data || error.message
            );

            return req.error(
                500,
                error.response?.data?.error_description ||
                error.response?.data?.message ||
                error.message ||
                "Unable to retrieve Job Scheduler logs"
            );
        }
    });


});
/*

import cds from "@sap/cds";

export default cds.service.impl(async function () {
    const remote = await cds.connect.to("D4L");

    this.on("READ", "A_JournalEntryItemBasic", async () => {
        console.log("Calling on-premise D4L from CAP");

        const result = await remote.send({
            method: "GET",
            path: "/A_JournalEntryItemBasic?$select=ID,Ledger,LedgerFiscalYear&$top=5"
        });

        console.log(
            "D4L call completed. Records:",
            Array.isArray(result) ? result.length : result
        );

        return result;
    });
});*/