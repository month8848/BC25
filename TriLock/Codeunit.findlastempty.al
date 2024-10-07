codeunit 50302 findlastempty
{
    trigger OnRun()
    var
        i: Integer;
        lockrec: Record EmptyTable;
    begin
        lockrec.reset();
        lockrec.LockTable();
        if lockrec.FindLast() then
            i := lockrec."Entry No." + 1;

        lockrec.Init();
        lockrec."Entry No." := i;
        lockrec."Document No." := 'DocNo' + Format(i);
        lockrec.Insert;

        Sleep(60000);
    end;

    var
        myInt: Integer;
}