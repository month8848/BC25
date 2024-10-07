page 50130 ClientAddinDemo
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                usercontrol(WebserviceAddin; WebserviceAddin)
                {
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {

            action(GetPrintersViaAddin)
            {
                ApplicationArea = All;
                Image = Print;
                trigger OnAction()
                begin
                    CurrPage.WebserviceAddin.CallWebService('http://localhost:5000/Class1');
                end;
            }
        }
    }

    var
        myInt: Integer;
}