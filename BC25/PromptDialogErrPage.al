page 50312 PromptDialogErr
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
                begin
                    Error('This is an example of rendering an error that happens in the prompt dialog, e.g., during Generate');
                end;
            }
        }
    }

    var
        UserInput: Text[100];
        Output: Text[100];
}