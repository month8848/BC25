page 50108 "MNB Azure Containers"

{

    Caption = 'Azure Containers';

    PageType = List;
    SourceTable = "ABS Container";

    UsageCategory = None;

    Editable = false;

    InsertAllowed = false;

    DeleteAllowed = false;

    ModifyAllowed = false;



    layout

    {

        area(content)

        {

            repeater(General)

            {

                field(Name; Rec.Name)

                {

                    ApplicationArea = All;

                    ToolTip = 'Specifies the value of the Name field.';

                }

            }

        }

    }
}