pageextension 50101 "MNB Customer Card" extends "Customer Card"

{
    layout
    {
        addlast(General)
        {
            field("MNB Ready For Sync."; Rec."MNB Ready For Sync.")
            {
                ApplicationArea = All;

                ToolTip = 'Set if the customer is ready for sync with external software.';
            }
        }
    }

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