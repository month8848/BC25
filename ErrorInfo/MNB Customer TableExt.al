tableextension 50101 "MNB Customer" extends Customer

{

    fields

    {
        field(50101; "MNB Ready For Sync."; Boolean)

        {

            Caption = 'Ready For Sync.';

            DataClassification = SystemMetadata;

            trigger OnValidate()

            var

                SyncCustomerEvent: Codeunit "MNB Sync Customer Event";

            begin

                if Rec."MNB Ready For Sync." then
                    SyncCustomerEvent.CustomerReadyForSync(Rec.SystemId, Rec."No.", Rec.Name);

            end;
        }

        modify(Blocked)

        {

            trigger OnBeforeValidate()

            begin

                //Show error message if the customer has open orders when blocking the customer
                // CheckOpenSalesOrders();
                // CheckOpenSalesOrdersForCustomer();


                TestAllMandatoryFields(Rec);
            end;

        }

    }



    local procedure CheckOpenSalesOrders()

    var

        ErrorInfoMsg: ErrorInfo;

        CustomerCannotHaveOrdersErr: Label 'Customer has open orders';

        OrderErrorWhenBlockingErr: Label 'When blocking the customer, the customer cannot have open orders. Please close all open orders before blocking the customer.';

        ShowOrdersLbl: Label 'Show orders';

    begin
        if Rec.Blocked <> Blocked::All then
            exit;
        Rec.CalcFields("No. of Orders");
        if Rec."No. of Orders" = 0 then
            exit;

        ErrorInfoMsg := ErrorInfo.Create(OrderErrorWhenBlockingErr, true);
        ErrorInfoMsg.Title(CustomerCannotHaveOrdersErr);
        ErrorInfoMsg.PageNo(Page::"Sales Order List");
        ErrorInfoMsg.AddNavigationAction(ShowOrdersLbl);
        Error(ErrorInfoMsg);

    end;

    local procedure CheckOpenSalesOrdersForCustomer()

    var

        ErrorInfoMsg: ErrorInfo;

        CustomerCannotHaveOrdersErr: Label 'Customer has open orders.';

        OrderErrorWhenBlockingErr: Label 'When blocking the customer, the customer cannot have open orders. Please close all open orders before blocking the customer.';

        ShowOrdersLbl: Label 'Show orders';

    begin

        if Rec.Blocked <> Blocked::All then
            exit;

        Rec.CalcFields("No. of Orders");

        if Rec."No. of Orders" = 0 then
            exit;

        ErrorInfoMsg := ErrorInfo.Create(OrderErrorWhenBlockingErr, true);

        ErrorInfoMsg.Title(CustomerCannotHaveOrdersErr);

        ErrorInfoMsg.CustomDimensions.Add('CustomerNo', Rec."No.");

        ErrorInfoMsg.AddAction(ShowOrdersLbl, Codeunit::"MNB Actions Error - Customer", 'OpenSalesOrders');

        Error(ErrorInfoMsg);
    end;

    [ErrorBehavior(ErrorBehavior::Collect)]

    internal procedure TestAllMandatoryFields(RecToCheck: Variant)
    var
        MandatoryFieldsSetup: Record "MNB Mandatory Field Setup";
        TempErrorMessage: Record "Error Message" temporary;
        RecRef: RecordRef;
        FldRec: FieldRef;
        ErrorInfoMsg, CollectedErrorInfo : ErrorInfo;
        FieldIsMandatoryErr: Label 'Field %1 is mandatory.', Comment = '%1 - field caption';
        FieldsAreSetMsg: Label 'All mandatory fields for %1 are filled in.', Comment = '%1 - table caption';
        ShowOrdersLbl: Label 'Show orders';
    begin
        if not RecToCheck.IsRecord then
            exit;

        RecRef.GetTable(RecToCheck);
        MandatoryFieldsSetup.SetRange("Table No.", RecRef.Number);
        if MandatoryFieldsSetup.FindSet() then begin
            repeat
                FldRec := RecRef.Field(MandatoryFieldsSetup."Field No.");
                if Format(FldRec.Value) = '' then begin
                    ErrorInfoMsg := ErrorInfo.Create(StrSubstNo(FieldIsMandatoryErr, FldRec.Caption), true);
                    ErrorInfoMsg.RecordId(RecRef.RecordId);
                    ErrorInfoMsg.FieldNo(FldRec.Number);
                    Error(ErrorInfoMsg);
                end;
            until MandatoryFieldsSetup.Next() = 0;

            if not HasCollectedErrors then
                Message(FieldsAreSetMsg, RecRef.Caption)
            else begin
                foreach CollectedErrorInfo in system.GetCollectedErrors() do
                    TempErrorMessage.LogSimpleMessage(0, CollectedErrorInfo.Message);

                ClearCollectedErrors();
                TempErrorMessage.ShowErrorMessages(true);

            end;

        end;
    end;
}