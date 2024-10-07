Codeunit 50304 MyBusinessEvents
{
    var
        EventCategory: Enum EventCategory;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TransferOrder-Post (Yes/No)", 'OnAfterPost', '', false, false)]
    local procedure OnAfterPostTransferOrder(var TransHeader: Record "Transfer Header"; Selection: Option " ",Shipment,Receipt)
    var
        Url: Text[250];
        TransferReceiptApiUrlTok: Label 'v2.0/companies(%1)/transferReceiptHeader(%2)', Locked = true;
        TransferShipmentApiUrlTok: Label 'v2.0/companies(%1)/transferShipmentHeader(%2)', Locked = true;
        Company: Record Company;
        TransferReceiptHeader: Record "Transfer Receipt Header";
        TransferShipmentHeader: Record "Transfer Shipment Header";
    begin

        Company.Get(CompanyName); //Because Company Id is not available yet

        if Selection = Selection::Shipment then begin
            TransferShipmentHeader.SetRange("Transfer Order No.", TransHeader."No.");
            TransferShipmentHeader.FindLast();
            Url := GetBaseUrl() + StrSubstNo(TransferShipmentApiUrlTok, GetCompanyId(), TrimId(TransferShipmentHeader.SystemId));
            MyBusinessEventTransferOrderPostedShipment(TransferShipmentHeader.SystemId, Url, Company.SystemId, TransferShipmentHeader."Direct Transfer");
        end;
        if Selection = Selection::Receipt then begin
            TransferReceiptHeader.SetRange("Transfer Order No.", TransHeader."No.");
            TransferReceiptHeader.FindLast();
            Url := GetBaseUrl() + StrSubstNo(TransferReceiptApiUrlTok, GetCompanyId(), TrimId(TransferReceiptHeader.SystemId));
            MyBusinessEventTransferOrderPostedReceipt(TransferReceiptHeader.SystemId, Url, Company.SystemId, TransHeader."Direct Transfer");
        end;
    end;

    [ExternalBusinessEvent('TransferOrderPostedShipment', 'Transfer Order Posted for Shipment', 'This business event is triggered when a Transfer Order is posted', EventCategory::"MNB Custom")]
    local procedure MyBusinessEventTransferOrderPostedShipment(TrasferOrderId: Guid; Url: text[250]; CompanyId: Guid; DirectTransfer: Boolean)
    begin
    end;

    [ExternalBusinessEvent('TransferOrderPostedShipmentReceipt', 'Transfer Order Posted for Receipt', 'This business event is triggered when a Transfer Order is posted', EventCategory::"MNB Custom")]
    local procedure MyBusinessEventTransferOrderPostedReceipt(TrasferOrderId: Guid; Url: text[250]; CompanyId: Guid; DirectTransfer: Boolean)
    begin
    end;

    local procedure GetBaseUrl(): text
    begin
        exit(GetUrl(CLIENTTYPE::Api));
    end;

    local procedure GetCompanyId(): text
    var
        Company: Record Company;
    begin
        Company.Get(CompanyName);
        exit(TrimId(Company.SystemId));
    end;

    local procedure TrimId(Id: Guid): Text
    begin
        exit(DelChr(Format(Id), '<>', '{}'));
    end;

    [EventSubscriber(ObjectType::Table, Database::"Price List Line", OnBeforeDeleteEvent, '', false, false)]
    local procedure OnBeforeDeletePriceListLine(var Rec: Record "Price List Line")
    begin
        if Rec."Unit Price" > 100 then
            Message('Unit Price cannot be greater than 100');
    end;
}