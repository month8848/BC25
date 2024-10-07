query 50301 GLQuery
{
    QueryType = Normal;

    elements
    {
        dataitem(GLAccount; "G/L Account")
        {
            column(No; "No.")
            {

            }

            dataitem(GLEntry; "G/L Entry")
            {
                DataItemLink = "G/L Account No." = GLAccount."No.";
                column(Posting_Date; "Posting Date")
                {

                }
                column(Global_Dimension_1_Code; "Global Dimension 1 Code")
                {

                }
                column(Global_Dimension_2_Code; "Global Dimension 2 Code")
                {

                }
                column(Debit_Amount; "Debit Amount")
                {
                    Method = Sum;
                }
                column(Credit_Amount; "Credit Amount")
                {
                    Method = Sum;
                }
                column(Amount; Amount)
                {
                    Method = Sum;
                }
            }
        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}