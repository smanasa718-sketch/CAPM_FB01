using { D4L } from './external/D4L';

@path : '/service/ZFI_ODATAService'
service ZFI_ODATAService
{
    @cds.redirection.target
    entity A_JournalEntryItemBasic as
        projection on D4L.A_JournalEntryItemBasic;

    @requires: 'JOBSCHEDULER'
    function runJournalEntryJob() returns LargeString;

    action scheduleJournalEntryJob() returns String; 

    action postJournalEntry(payload: LargeString) returns String;

    action getLatestJobResult() returns LargeString;

}

annotate ZFI_ODATAService with @requires :
[
    'authenticated-user'
];
