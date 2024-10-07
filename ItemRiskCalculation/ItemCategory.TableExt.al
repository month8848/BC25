tableextension 50106 "MNB Item Category" extends "Item Category"
{
    fields
    {
        field(50100; "MNB Risk Impact"; Integer)
        {
            DataClassification = CustomerContent;
            MinValue = 0;
            Caption = 'Risk Impact';
            BlankZero = true;

        }

    }

}