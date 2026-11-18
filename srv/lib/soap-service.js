
import soap from "soap";
import { executeHttpRequest } from "@sap-cloud-sdk/http-client";
import { getDestination } from "@sap-cloud-sdk/connectivity";
import path from "node:path";
import { fileURLToPath } from "node:url";

const currentFile = fileURLToPath(import.meta.url);
const currentDir = path.dirname(currentFile);

const WSDL_PATH = path.resolve(
  currentDir,
  "../external/JOURNALENTRYPOST.wsdl"
);

const DESTINATION_NAME = "D4L";

const SERVICE_PATH =
  "/sap/bc/srt/xip/sap/journalentrycreaterequestconfi/400/journalentrypost/journalentrypostbinding";

export async function getJournalEntrySoapClient() {
  const destination = await getDestination({
    destinationName: DESTINATION_NAME
  });

  if (!destination) {
    throw new Error(
      `BTP destination "${DESTINATION_NAME}" was not found.`
    );
  }

  const baseUrl = destination.url.replace(/\/+$/, "");
  const endpointUrl = `${baseUrl}${SERVICE_PATH}`;

  const httpClient = {
    request: async (
      url,
      data,
      callback,
      exheaders,
      exoptions
    ) => {
      try {
        const response = await executeHttpRequest(
          destination,
          {
            method: "POST",
            url: endpointUrl,
            data,
            headers: exheaders
          },
          {
            ...exoptions,
            fetchCsrfToken: false
          }
        );

        callback(null, response, response.data);
      } catch (error) {
        callback(error);
      }
    }
  };

  const client = await soap.createClientAsync(WSDL_PATH, {
    httpClient
  });

  client.setEndpoint(endpointUrl);

  return { client, endpointUrl };
}
