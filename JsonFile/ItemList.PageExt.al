pageextension 50103 "MNB Item List" extends "Item List"

{

    actions

    {

        addlast(Functions)

        {

            action(MNBImportJson)

            {

                ApplicationArea = All;

                Caption = 'Import From Json';

                Image = Import;

                ToolTip = 'Import items from Json file.';

                trigger OnAction()

                var

                    ImportItemsJson: Codeunit "MNB Import Items Json";

                begin

                    ImportItemsJson.ImportItemsFromJson();

                end;

            }

        }

        addlast(Category_Process)

        {

            actionref(MNBImportJson_Promoted; MNBImportJson)

            {

            }

        }

    }

}