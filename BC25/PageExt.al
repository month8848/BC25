pageextension 50311 "Customer with prompt" extends "Customer Card"
{
    actions
    {
        addlast(Prompting)
        {
            action(DraftWithCopilot)
            {
                Caption = 'Draft with Copilot';
                Ellipsis = true;
                trigger OnAction()
                begin
                    Message('Draft with Copilot pressed');
                end;
            }
            action(OpenModal)
            {
                Caption = 'Open Modal';
                Ellipsis = true;
                trigger OnAction()
                begin
                    RunModal(22);
                end;
            }
            action(PromptDialogMsg)
            {
                Caption = 'Open PromptDialogMsg';
                Ellipsis = true;
                trigger OnAction()
                begin
                    RunModal(50311);
                end;
            }
            action(PromptDialogErr)
            {
                Caption = 'Open PromptDialogErr';
                Ellipsis = true;
                trigger OnAction()
                begin
                    RunModal(50312);
                end;
            }
            action(PromptDialogErrInfo)
            {
                Caption = 'Open PromptDialogErrInfo';
                Ellipsis = true;
                trigger OnAction()
                begin
                    RunModal(50313);
                end;
            }
            action(PromptDialogErrMutil)
            {
                Caption = 'Open PromptDialogErrMutil';
                Ellipsis = true;
                trigger OnAction()
                begin
                    RunModal(50314);
                end;
            }
            group(PromptGroup)
            {
                action(PromptAction1)
                {
                    trigger OnAction()
                    begin
                        Message('PromptAction1 pressed');
                    end;
                }
                action(PromptAction2)
                {
                    trigger OnAction()
                    begin
                        Message('PromptAction2 pressed');
                    end;
                }
            }
        }
        addafter("Prices and Discounts")
        {
            action(TernaryOperator)
            {
                Caption = 'Ternary Operator';
                ApplicationArea = Basic, Suite;
                trigger OnAction()
                var
                    myboolean: Boolean;
                    mayText: Text;
                begin
                    myboolean := Rec."Prices Including VAT";

                    mayText := myboolean ? 'True' : 'False';
                    Message(mayText);
                end;
            }
        }
        addafter(PriceLines_Promoted)
        {
            actionref(TernaryOperator_Promoted; TernaryOperator)
            {
            }
        }
    }
}