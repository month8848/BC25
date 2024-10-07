pageextension 50303 "YC Detailed Cust. Ledg. Entry" extends "Detailed Cust. Ledg. Entries"
{
    layout
    {
        addafter("Customer No.")
        {
            field("Description"; Rec.Description)
            {
                ApplicationArea = All;

            }
        }
    }
}