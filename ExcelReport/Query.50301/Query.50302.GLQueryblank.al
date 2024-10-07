query 50302 GLQueryBlank
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

                column(Dim1Code; "Global Dimension 1 Code")
                {

                }
                column(Dim2Code; "Global Dimension 2 Code")
                {

                }
                column(Posting_Date; "Posting Date")
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