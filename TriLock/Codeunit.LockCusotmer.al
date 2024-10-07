codeunit 50301 LockCustomer
{
    Permissions = tabledata "Detailed Cust. Ledg. Entry" = rimd;

    trigger OnRun()
    var
        Customer1: Record microsoft.Sales.Customer.Customer;
    begin
        Customer1.LockTable();
        Sleep(60000);
    end;


    procedure modifydes()
    var
        DetailedCLE: Record "Detailed Cust. Ledg. Entry";
    begin
        DetailedCLE.FindFirst();
        DetailedCLE.Description := format(CurrentDateTime);
        DetailedCLE.Modify();
    end;

    var
        currRec: Record Currency;
        currRec2: Record Currency;
        sid: Integer;
}
