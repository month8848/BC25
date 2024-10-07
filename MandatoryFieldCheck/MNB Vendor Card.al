pageextension 50102 "MNB Vendor Card" extends "Vendor Card"

{

    actions

    {

        addlast("F&unctions")

        {

            action(MNBCheckMandatoryFields)

            {

                ApplicationArea = All;

                Image = CheckList;

                Caption = 'Check Mandatory Fields';

                ToolTip = 'Check if all mandatory fields are filled in on the card.';

                trigger OnAction()

                var

                    MandatoryFieldCheck: Codeunit "MNB Mandatory Field Check";

                begin

                    MandatoryFieldCheck.TestMandatoryFields(Rec);
                end;

            }

        }

        addlast(Category_Process)

        {

            actionref(MNBCheckMandatoryFields_Promoted; MNBCheckMandatoryFields)

            {

            }

        }

    }
}