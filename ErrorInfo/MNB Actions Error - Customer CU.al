codeunit 50113 "MNB Actions Error - Customer"

{

    procedure OpenSalesOrders(ErrorInfoMsg: ErrorInfo)

    var

        SalesHeader: Record "Sales Header";

        CustomerNo: Code[20];

    begin

        CustomerNo := ErrorInfoMsg.CustomDimensions.Get('CustomerNo');

        if CustomerNo = '' then
            exit;

        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);

        SalesHeader.SetRange("Sell-to Customer No.", CustomerNo);

        Page.RunModal(Page::"Sales Order List", SalesHeader);
    end;
}