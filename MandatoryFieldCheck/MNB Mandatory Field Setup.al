table 50108 "MNB Mandatory Field Setup"

{

    Caption = 'Mandatory Field Setup';

    DataClassification = CustomerContent;



    fields

    {

        field(1; "Table No."; Integer)

        {

            Caption = 'Table No.';

            NotBlank = true;

            BlankZero = true;

            MinValue = 0;

            trigger OnValidate()

            begin

                CalcFields("Table Name");

            end;

        }

        field(2; "Table Name"; Text[249])

        {

            Caption = 'Table Name';

            FieldClass = FlowField;

            CalcFormula = lookup(AllObjWithCaption."Object Caption" where("Object Type" = const(Table), "Object ID" = field("Table No.")));

        }

        field(3; "Field No."; Integer)

        {

            Caption = 'Field No.';

            NotBlank = true;

            BlankZero = true;

            trigger OnValidate()

            var

                TableNoErr: Label 'Table No. must have a value.';

                FieldNoErr: Label 'Field No. must have a value.';

            begin

                if "Table No." = 0 then
                    Error(TableNoErr);

                if "Field No." = 0 then
                    Error(FieldNoErr);

                CheckIfFieldIsTextField();

                CalcFields("Field Caption");

            end;

        }

        field(4; "Field Caption"; Text[100])

        {
            Caption = 'Field Caption';

            FieldClass = FlowField;

            CalcFormula = lookup(Field."Field Caption" where(TableNo = field("Table No."), "No." = field("Field No.")));

        }

    }



    keys

    {

        key(PK; "Table No.", "Field No.")

        {

            Clustered = true;

        }

    }



    local procedure CheckIfFieldIsTextField()

    var

        SelectedField: Record Field;

        TypeErr: Label 'Field must be a Text or Code field.';

    begin

        SelectedField.Get("Table No.", "Field No.");

        if not (SelectedField.Type in [SelectedField.Type::Text, SelectedField.Type::Code]) then
            Error(TypeErr);

    end;
}