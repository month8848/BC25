codeunit 50300 createCurrencies
{
    trigger OnRun()

    begin
        // Add code here
        currRec.Code := 'YC2';
        if currRec.Insert() then;

        // currRec.FindLast();
        currRec2.Reset();
        currRec2.SetFilter(Code, 'S*');

        currRec2.FindSet();
        Sleep(60000);

        // currRec.FindLast();
    end;

    procedure CreateZipFile()
    var
        DataCompression: Codeunit "Data Compression";
        outs: OutStream;
    begin
        DataCompression.SaveZipArchive(outs);
        ;
    end;

    var
        currRec: Record Currency;
        currRec2: Record Currency;
        sid: Integer;
}
