page 50302 "YC Job Queue Entry API"
{
    APIGroup = 'api';
    APIPublisher = 'pbc';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'jobQueueEntryAPI';
    DelayedInsert = true;
    EntityName = 'jobqueueentry';
    EntitySetName = 'jobqueueentries';
    PageType = API;
    SourceTable = "Job Queue Entry";
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'id';
                    Editable = false;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(earliestStartDateTime; Rec."Earliest Start Date/Time")
                {
                    Caption = 'Earliest Start Date/Time';
                }
                field(endingTime; Rec."Ending Time")
                {
                    Caption = 'Ending Time';
                }
                field(entryNo; Rec."Entry No.")
                {
                    Caption = 'Entry No.';
                }
                field(errorMessage; Rec."Error Message")
                {
                    Caption = 'Error Message';
                }
                field(errorMessageRegisterId; Rec."Error Message Register Id")
                {
                    Caption = 'Error Message Register Id';
                }
                field(expirationDateTime; Rec."Expiration Date/Time")
                {
                    Caption = 'Expiration Date/Time';
                }
                field(inactivityTimeoutPeriod; Rec."Inactivity Timeout Period")
                {
                    Caption = 'Inactivity Timeout Period';
                }
                field(jobQueueCategoryCode; Rec."Job Queue Category Code")
                {
                    Caption = 'Job Queue Category Code';
                }
                field(jobTimeout; Rec."Job Timeout")
                {
                    Caption = 'Job Timeout';
                }
                field(lastReadyState; Rec."Last Ready State")
                {
                    Caption = 'Last Ready State';
                }
                field(manualRecurrence; Rec."Manual Recurrence")
                {
                    Caption = 'Manual Recurrence';
                }
                field(maximumNoOfAttemptsToRun; Rec."Maximum No. of Attempts to Run")
                {
                    Caption = 'Maximum No. of Attempts to Run';
                }
                field(nextRunDateFormula; Rec."Next Run Date Formula")
                {
                    Caption = 'Next Run Date Formula';
                }
                field(noOfAttemptsToRun; Rec."No. of Attempts to Run")
                {
                    Caption = 'No. of Attempts to Run';
                }
                field(noOfMinutesBetweenRuns; Rec."No. of Minutes between Runs")
                {
                    Caption = 'No. of Minutes between Runs';
                }
                field(notifyOnSuccess; Rec."Notify On Success")
                {
                    Caption = 'Notify On Success';
                }
                field(objectCaptionToRun; Rec."Object Caption to Run")
                {
                    Caption = 'Object Caption to Run';
                }
                field(objectIDToRun; Rec."Object ID to Run")
                {
                    Caption = 'Object ID to Run';
                }
                field(objectTypeToRun; Rec."Object Type to Run")
                {
                    Caption = 'Object Type to Run';
                }
                field(parameterString; Rec."Parameter String")
                {
                    Caption = 'Parameter String';
                }
                field(printerName; Rec."Printer Name")
                {
                    Caption = 'Printer Name';
                }
                field(priorityWithinCategory; Rec."Priority Within Category")
                {
                    Caption = 'Priority';
                }
                field(recordIDToProcess; Rec."Record ID to Process")
                {
                    Caption = 'Record ID to Process';
                }
                field(recurringJob; Rec."Recurring Job")
                {
                    Caption = 'Recurring Job';
                }
                field(referenceStartingTime; Rec."Reference Starting Time")
                {
                    Caption = 'Reference Starting Time';
                }
                field(reportOutputType; Rec."Report Output Type")
                {
                    Caption = 'Report Output Type';
                }
                field(reportRequestPageOptions; Rec."Report Request Page Options")
                {
                    Caption = 'Report Request Page Options';
                }
                field(rerunDelaySec; Rec."Rerun Delay (sec.)")
                {
                    Caption = 'Rerun Delay (sec.)';
                }
                field(runInUserSession; Rec."Run in User Session")
                {
                    Caption = 'Run in User Session';
                }
                field(runOnFridays; Rec."Run on Fridays")
                {
                    Caption = 'Run on Fridays';
                }
                field(runOnMondays; Rec."Run on Mondays")
                {
                    Caption = 'Run on Mondays';
                }
                field(runOnSaturdays; Rec."Run on Saturdays")
                {
                    Caption = 'Run on Saturdays';
                }
                field(runOnSundays; Rec."Run on Sundays")
                {
                    Caption = 'Run on Sundays';
                }
                field(runOnThursdays; Rec."Run on Thursdays")
                {
                    Caption = 'Run on Thursdays';
                }
                field(runOnTuesdays; Rec."Run on Tuesdays")
                {
                    Caption = 'Run on Tuesdays';
                }
                field(runOnWednesdays; Rec."Run on Wednesdays")
                {
                    Caption = 'Run on Wednesdays';
                }
                field(scheduled; Rec.Scheduled)
                {
                    Caption = 'Scheduled';
                }
                field(startingTime; Rec."Starting Time")
                {
                    Caption = 'Starting Time';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
                field(systemTaskID; Rec."System Task ID")
                {
                    Caption = 'System Task ID';
                }
                field(systemCreatedAt; Rec.SystemCreatedAt)
                {
                    Caption = 'SystemCreatedAt';
                }
                field(systemCreatedBy; Rec.SystemCreatedBy)
                {
                    Caption = 'SystemCreatedBy';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(systemModifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'SystemModifiedAt';
                }
                field(systemModifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'SystemModifiedBy';
                }
                field(userID; Rec."User ID")
                {
                    Caption = 'User ID';
                }
                field(userLanguageID; Rec."User Language ID")
                {
                    Caption = 'User Language ID';
                }
                field(userServiceInstanceID; Rec."User Service Instance ID")
                {
                    Caption = 'User Service Instance ID';
                }
                field(userSessionID; Rec."User Session ID")
                {
                    Caption = 'User Session ID';
                }
                field(userSessionStarted; Rec."User Session Started")
                {
                    Caption = 'User Session Started';
                }
                field(xml; Rec.XML)
                {
                    Caption = 'XML';
                }
            }
        }
    }
}
