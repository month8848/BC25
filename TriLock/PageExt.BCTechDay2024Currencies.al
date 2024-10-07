pageextension 50300 BCTechDay2024Currencies extends Currencies
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addlast("F&unctions")
        {
            action(trilock)
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    currRec: Record Currency;
                    currRec2: Record Currency;
                    sid: Integer;
                begin
                    // Add code here
                    StartSession(sid, 50300);
                    Sleep(100);

                    currRec.Code := 'YC';
                    if currRec.Insert() then;

                    currRec2.Reset();
                    currRec2.SetFilter(Code, 'S*');
                    currRec2.FindSet();

                    Message('only reachable with triLock');
                end;
            }
            action(ReadCommitted)
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    currRec: Record Currency;
                    currRec2: Record Currency;
                    sid: Integer;
                begin
                    // Add code here
                    StartSession(sid, 50300);
                    Sleep(100);

                    currRec.Code := 'YC';
                    if currRec.Insert() then;


                    currRec2.Reset();
                    currRec2.SetFilter(Code, 'S*');
                    currRec2.ReadIsolation := IsolationLevel::ReadCommitted;
                    currRec2.FindSet();

                    // Sleep(60000);

                    Message('only reachable with ReadCommitted');
                end;
            }
            action(ReadUnCommitted)
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    currRec: Record Currency;
                    currRec2: Record Currency;
                    sid: Integer;
                begin
                    if currRec2.Get('YC') then
                        Error('find not uncommited Currency YC');
                end;
            }
            action(ModifyDiff1)
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    currRec1: Record Currency;
                    currRec2: Record Currency;

                    sid: Integer;
                begin
                    // Add code here
                    currRec1.FindFirst();

                    currRec1.Code := 'DKK1';
                    currRec1."ISO Code" := 'DKK';
                    currRec1.Symbol := 'kr';
                    currRec1.Insert();

                    currRec2.FindLast();
                end;
            }
            action(ModifyDiff2)
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    currRec1: Record Currency;
                    currRec2: Record Currency;

                    sid: Integer;
                begin
                    // Add code here
                    currRec2.FindLast();
                    currRec2.Description := Format(CurrentDateTime);
                    currRec2.Modify();
                    Sleep(60000);
                end;
            }
            action(TwoVarModify)
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    currRec1: Record Currency;
                    currRec2: Record Currency;
                    currRec3: Record Currency;
                begin
                    currRec1.code := 'ZZZ';
                    currRec1.Insert();
                    Commit();

                    currRec1.FindLast();
                    currRec1.Delete();

                    currRec2.FindFirst();
                    currRec3.FindFirst();
                    currRec3.Description := 'FOO';
                    currRec3.Modify();

                    currRec2."ISO Numeric Code" := '42';
                    currRec2.Modify();

                    currRec1.FindFirst();
                    // Error(currRec1.Description);
                end;
            }
        }

    }

    var
        myInt: Integer;
}