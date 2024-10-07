pageextension 50301 "BC2024 Customer List" extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addlast(processing)
        {
            action(FindsetOnOtherVar)
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    Customer1: Record Customer;
                    AnotherCustomer: Record Customer;
                    sid: Integer;
                begin
                    Customer1.LockTable();
                    AnotherCustomer.FindSet();
                    Sleep(100);
                end;
            }
            action(CountAfterInsert)
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    Customer1: Record Customer;
                    AnotherCustomer: Record Customer;
                    sid: Integer;
                begin
                    Customer1."No." := 'AAA';
                    if Customer1.Insert() then;

                    AnotherCustomer.Reset();
                    AnotherCustomer.SetFilter("No.", 'C*');
                    sid := AnotherCustomer.count();
                    Sleep(100);
                end;
            }
            action(CalcufieldAfterInsert)
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    LockCustomer: Codeunit LockCustomer;
                    AnotherCustomer: Record Customer;
                    sid: Integer;
                begin
                    LockCustomer.modifydes();

                    AnotherCustomer.FindFirst();
                    AnotherCustomer.CalcFields(Balance);
                    Sleep(100);
                end;
            }
            action(WrtieOperationExample)
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    Customer1: Record microsoft.Sales.Customer.Customer;
                    AnotherCustomer: Record microsoft.Sales.Customer.Customer;
                    sid: Integer;
                begin
                    Customer1.FindFirst();
                    Customer1.Name := Customer1.Name + ' - TEST';
                    Customer1.Modify();

                    AnotherCustomer.FindLast();
                    Sleep(100);
                end;
            }
            action(FindSetonEmptyTable)
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    EmptyTable: Record EmptyTable;
                    AnotherCustomer: Record Customer;
                    sid: Integer;
                begin
                    EmptyTable.deleteAll();

                    EmptyTable.Reset();
                    EmptyTable.SetRange("Entry No.", 1);
                    if not EmptyTable.FindSet() then
                        Sleep(100);
                end;
            }

        }

    }

    var
        myInt: Integer;
}