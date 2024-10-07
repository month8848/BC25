table 50304 "MNP TrailBalancebuffer"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "G/L Account No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(2; "Global Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "Global Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(10; "Previous Balance"; Decimal)
        {
            AutoFormatType = 1;

        }
        field(11; "Debit Amount"; Decimal)
        {
            AutoFormatType = 1;

        }
        field(12; "Credit Amount"; Decimal)
        {
            AutoFormatType = 1;

        }
        field(13; "End Balance"; Decimal)
        {
            AutoFormatType = 1;

        }
    }

    keys
    {
        key(PK; "G/L Account No.", "Global Dimension 1 Code", "Global Dimension 2 Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}