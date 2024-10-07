codeunit 50115 "MNB Sync Customer Event"

{
    [ExternalBusinessEvent('MNBCustomerReadyForSync', 'Customer Ready For Sync.', 'Triggered when a customer is set that can be synchronized.', EventCategory::"MNB Custom")]

    procedure CustomerReadyForSync(customerId: Guid; customerNo: Code[20]; customerName: Text[100])

    begin

    end;

}