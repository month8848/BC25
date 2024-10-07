namespace ALProject.ALProject;

page 50300 "Empty Table"
{
    ApplicationArea = All;
    Caption = 'EmptyTable';
    PageType = List;
    SourceTable = EmptyTable;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
            }
        }

    }
    actions
    {
        area(Processing)
        {
            action(Add5010)
            {
                ApplicationArea = All;
                Caption = 'Add5010';
                Promoted = true;
                PromotedCategory = Process;
                Image = Add;

                trigger OnAction()
                var
                    i: Integer;
                begin
                    //add 5000 records
                    rec.deleteall();
                    for i := 1 to 50100 do begin
                        Rec."Entry No." := i;
                        Rec."Document No." := 'DocNo' + Format(i);
                        Rec.Insert;
                    end;
                end;
            }
            action(Lock5000)
            {
                ApplicationArea = All;
                Caption = 'Lock5000';
                Promoted = true;
                PromotedCategory = Process;
                Image = Add;

                trigger OnAction()
                var
                    i: Integer;
                    lockrec: Record EmptyTable;
                begin
                    //add 5000 records
                    lockrec.reset();
                    lockrec.LockTable();
                    lockrec.setrange("Entry No.", 1, 50000);
                    if lockrec.FindSet() then
                        repeat
                        until lockrec.Next() = 0;
                    Sleep(60000);
                end;
            }
            action(Findlast)
            {
                ApplicationArea = All;
                Caption = 'Findlast';
                Promoted = true;
                PromotedCategory = Process;
                Image = Add;

                trigger OnAction()
                var
                    i: Integer;
                    lockrec: Record EmptyTable;
                    sid: Integer;
                begin
                    //Find last record +1
                    StartSession(sid, 50302);
                    Sleep(100);

                    lockrec.reset();
                    // lockrec.LockTable();
                    if lockrec.FindLast() then
                        i := lockrec."Entry No." + 1;


                    lockrec.Init();
                    lockrec."Entry No." := i;
                    lockrec."Document No." := 'DocNo' + Format(i);
                    lockrec.Insert;
                end;
            }
            action(Findlast2)
            {
                ApplicationArea = All;
                Caption = 'Findlast2';
                Promoted = true;
                PromotedCategory = Process;
                Image = Add;

                trigger OnAction()
                var
                    i: Integer;
                    lockrec: Record EmptyTable;
                    sid: Integer;
                begin
                    lockrec.reset();
                    // lockrec.LockTable();
                    if lockrec.FindLast() then
                        i := lockrec."Entry No." + 1;


                    lockrec.Init();
                    lockrec."Entry No." := i;
                    lockrec."Document No." := 'DocNo' + Format(i);
                    lockrec.Insert;
                    Sleep(60000);
                end;
            }
        }
    }
}