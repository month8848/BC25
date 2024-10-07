page 50311 PromptDialogMsg
{
    PageType = PromptDialog;
    ApplicationArea = All;
    Caption = 'BC24 PromptDialogMsg';
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
                    Message('First message, which is not shown in the prompt dialog');
                    Message('Last message, which is shown in the prompt dialog');
                end;
            }
        }
    }

    var
        UserInput: Text[100];
        Output: Text[100];
}