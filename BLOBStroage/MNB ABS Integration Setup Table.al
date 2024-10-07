table 50102 "MNB ABS Integration Setup"
{
    Caption = 'Integration Setup';
    DataClassification = SystemMetadata;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }

        field(2; "Container Name"; Text[250])
        {
            Caption = 'Container Name';
        }

        field(3; "Azure Account Name"; Text[250])
        {
            Caption = 'Azure Account Name';
        }

        field(4; "Storage Key"; Text[1024])
        {
            Caption = 'Storage Key';
            ExtendedDatatype = Masked;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    var
        RecordHasBeenRead: Boolean;



    procedure GetRecordOnce()
    begin
        if RecordHasBeenRead then
            exit;

        Get();
        RecordHasBeenRead := true;
    end;

    procedure InsertIfNotExists()
    begin

        Reset();

        if not Get() then begin

            Init();

            Insert(true);

        end;

    end;
}