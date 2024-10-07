page 50114 "MNB Container Content"

{

    Caption = 'Azure Containers';

    PageType = List;

    SourceTable = "ABS Container Content";

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