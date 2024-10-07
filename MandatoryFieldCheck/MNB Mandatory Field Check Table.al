codeunit 50108 "MNB Mandatory Field Check"

{

    internal procedure TestMandatoryFields(RecToCheck: Variant)
    var
        MandatoryFieldsSetup: Record "MNB Mandatory Field Setup";
        RecRef: RecordRef;
        FldRef: FieldRef;
        FieldIsMandatoryErr: Label 'Field %1 is mandatory.', Comment = '%1 - field caption';
        FieldsAreSetMsg: Label 'All mandatory fields for %1 are filled in.', Comment = '%1 - table caption';
    begin
        if not RecToCheck.IsRecord then
            exit;

        RecRef.GetTable(RecToCheck);
        MandatoryFieldsSetup.SetRange("Table No.", RecRef.Number);
        if MandatoryFieldsSetup.FindSet() then begin
            repeat
                FldRef := RecRef.Field(MandatoryFieldsSetup."Field No.");
                if Format(FldRef.Value) = '' then
                    Error(FieldIsMandatoryErr, FldRef.Caption);
            until MandatoryFieldsSetup.Next() = 0;
            Message(FieldsAreSetMsg, RecRef.Caption);
        end;
    end;
}