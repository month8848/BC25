page 50113 "MNB Mandatory Field Setup2"

{
    PageType = List;
    SourceTable = "MNB Mandatory Field Setup";
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Mandatory Field Setup';

    layout
    {
        area(Content)
        {

            repeater(General)

            {

                field("Table No."; Rec."Table No.")

                {

                    ApplicationArea = All;

                    ToolTip = 'Specifies the table number of the table that contains the field that you want to make mandatory.';
                    trigger OnAssistEdit()

                    var

                        AllObjWithCaption: Record AllObjWithCaption;

                        ObjectAndFieldsMgt: Codeunit "MNB Object And Fields Mgt.";

                    begin

                        if ObjectAndFieldsMgt.SelectObject(AllObjWithCaption) then
                            Rec.Validate("Table No.", AllObjWithCaption."Object ID");

                    end;

                }

                field("Table Name"; Rec."Table Name")

                {

                    ApplicationArea = All;

                    ToolTip = 'Specifies the name of the table that contains the field that you want to make mandatory.';

                }

                field("Field No."; Rec."Field No.")

                {

                    ApplicationArea = All;

                    ToolTip = 'Specifies the field number of the field that you want to make mandatory.';

                    trigger OnAssistEdit()

                    var

                        SelectedField: Record Field;

                        ObjectAndFieldsMgt: Codeunit "MNB Object And Fields Mgt.";

                    begin

                        if ObjectAndFieldsMgt.SelectFieldNo(Rec."Table No.", SelectedField) then
                            Rec.Validate("Field No.", SelectedField."No.");

                    end;

                }

                field("Field Caption"; Rec."Field Caption")

                {

                    ApplicationArea = All;

                    ToolTip = 'Specifies the caption of the field that you want to make mandatory.';

                }

            }

        }

    }
}