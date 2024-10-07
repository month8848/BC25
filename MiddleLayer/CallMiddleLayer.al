codeunit 50110 "MNP Middle Call"
{
    trigger OnRun()
    var
        HttpClient: HttpClient;
        HttpResponse: HttpResponseMessage;
        ResponseText: text;
        Uri: Text;
    begin
        //call api with rest api
        Uri := 'http://localhost:5000/Class1';

        if HttpClient.Get(Uri, HttpResponse) then
            if HttpResponse.IsSuccessStatusCode() then begin
                HttpResponse.Content().ReadAs(ResponseText);
                Message(ResponseText);
            end;
    end;

    var
        myInt: Integer;
}