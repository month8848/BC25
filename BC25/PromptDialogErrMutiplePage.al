page 50314 PromptDialogErrMutiple
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
                    MyCollectibleErrorProc();
                end;
            }
        }
    }

    [ErrorBehavior(ErrorBehavior::Collect)]
    local procedure MyCollectibleErrorProc()
    begin
        Error(ErrorInfo.Create('Error 1', true));
        Error(ErrorInfo.Create('Error 2', true));
    end;

    var
        UserInput: Text[100];
        Output: Text[100];
}