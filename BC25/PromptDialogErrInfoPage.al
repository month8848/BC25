page 50313 PromptDialogErrInfo
{
    PageType = PromptDialog;
    ApplicationArea = All;
    Caption = 'BC24 PromptDialogErr';
    // PromptMode = Prompt;
    Extensible = false;
    // SourceTable = TableName;
    // SourceTableTemporary = true;

    layout
    {
        area(Prompt)
        {
            field(UserInput; UserInput)
            {
                ShowCaption = false;
                MultiLine = true;
            }
        }
        area(PromptOptions)
        {

        }
        area(Content)
        {
            field(Output; Output)
            {
                ShowCaption = false;
                MultiLine = true;
            }
        }
    }

    actions
    {
        area(SystemActions)
        {
            systemaction(Generate)
            {
                trigger OnAction()
                var
                    ErrorInfo: ErrorInfo;
                begin
                    ErrorInfo.Title('Error info title');
                    ErrorInfo.Message('Error message');
                    ErrorInfo.DetailedMessage('Detailed error');

                    Error(ErrorInfo);
                end;
            }
        }
    }

    var
        UserInput: Text[100];
        Output: Text[100];
}