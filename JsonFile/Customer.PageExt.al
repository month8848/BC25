pageextension 50110 "MNB Customer List" extends "Customer List"

{

    actions

    {

        addlast(processing)

        {

            action(MNBExportToJson)
            {
                ApplicationArea = All;
                Caption = 'Export to JSON';
                Image = ExportFile;
                ToolTip = 'Exports the customer list to a JSON file.';

                trigger OnAction()
                var
                    ExportCustomersJson: Codeunit "MNB Export Customers Json";
                begin
                    ExportCustomersJson.GenerateJsonForCustomers();
                end;
            }

        }
        addlast(Category_Process)
        {
            actionref(MNBExportToJson_Promoted; MNBExportToJson)
            {
            }
        }

    }
}