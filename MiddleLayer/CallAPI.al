page 50120 "MNP Call API"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'MNP Call API';

    layout
    {
        area(Content)
        {
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    callapi: Codeunit "MNP Middle Call";
                    WeatherForcastClient: Codeunit "Rest Client";
                begin
                    // callapi.Run();
                    Message(WeatherForcastClient.Get('http://localhost:5000/WeatherForecast').GetContent().AsText());
                end;
            }
        }
    }

    var
        myInt: Integer;
}