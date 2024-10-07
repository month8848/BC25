report 50300 "MNP Trail Balance"
{
    ApplicationArea = All;
    Caption = 'MNP Trail Balance';
    UsageCategory = ReportsAndAnalysis;
    ExcelLayoutMultipleDataSheets = true;
    DefaultRenderingLayout = TrailBalanceExcelLayout;

    dataset
    {
        dataitem(TrailBalanceData; "G/L Account")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Account Type", "Date Filter", "Budget Filter";

            column(AccountNumber; "No.")
            {
                IncludeCaption = true;
            }
            column(AccountName; "Name")
            {
                IncludeCaption = true;
            }
            column(AccountType; "Account Type")
            {
                IncludeCaption = true;
            }
            dataitem(TrailBalanceDetail; "MNP TrailBalancebuffer")
            {
                DataItemLink = "G/L Account No." = field("No.");
                // UseTemporary = true;

                column(GDim1Code; TrailBalanceDetail."Global Dimension 1 Code")
                {
                    IncludeCaption = true;
                }
                column(GDim2Code; TrailBalanceDetail."Global Dimension 2 Code")
                {
                    IncludeCaption = true;
                }
                column(PreBalance; TrailBalanceDetail."Previous Balance")
                {
                    IncludeCaption = true;
                }
                column(DebitAmount; TrailBalanceDetail."Debit Amount")
                {
                    IncludeCaption = true;
                }
                column(CreditAmount; TrailBalanceDetail."Credit Amount")
                {
                    IncludeCaption = true;
                }
                column(EndBalance; TrailBalanceDetail."End Balance")
                {
                    IncludeCaption = true;
                }
            }

            trigger OnAfterGetRecord()
            var
                gle: Record "G/L Entry";
                gleEnd: Record "G/L Entry";
                GLQuery: Query GLQuery;
                // GLqueryblank: Query GLQueryBlank;
                // TrailBal: Record "MNP TrailBalancebuffer";

                Dim1: Record "Dimension Value";
                Dim2: Record "Dimension Value";
                i: Integer;
            begin
                tmpBalance := 0;

                gle.Reset();
                gle.SetCurrentKey("G/L Account No.", "Posting Date", "Global Dimension 1 Code", "Global Dimension 2 Code");

                gleEnd.Reset();
                gleEnd.SetCurrentKey("G/L Account No.", "Posting Date", "Global Dimension 1 Code", "Global Dimension 2 Code");

                Dim1.Reset();
                Dim1.SetRange("Global Dimension No.", 1);
                if Dim1.FindSet() then
                    repeat
                        Dim2.Reset();
                        Dim2.SetRange("Global Dimension No.", 2);
                        if Dim2.FindSet() then
                            repeat
                                TrailBalanceDetail.Init();
                                TrailBalanceDetail."G/L Account No." := TrailBalanceData."No.";
                                TrailBalanceDetail."Global Dimension 1 Code" := Dim1.Code;
                                TrailBalanceDetail."Global Dimension 2 Code" := Dim2.Code;

                                gle.SetRange("G/L Account No.", TrailBalanceData."No.");
                                gle.SetRange("Posting Date", 0D, CalcDate('-1D', StartingDate));
                                gle.SetRange("Global Dimension 1 Code", Dim1.Code);
                                gle.SetRange("Global Dimension 2 Code", Dim2.Code);
                                gle.CalcSums(Amount);

                                TrailBalanceDetail."Previous Balance" := gle.Amount;

                                GLQuery.SetRange(No, TrailBalanceData."No.");
                                GLQuery.SetRange(Posting_Date, StartingDate, EndingDate);
                                GLQuery.SetRange(Global_Dimension_1_Code, Dim1.Code);
                                GLQuery.SetRange(Global_Dimension_2_Code, Dim2.Code);
                                GLQuery.Open();
                                while GLQuery.Read() do begin
                                    TrailBalanceDetail."Debit Amount" += GLQuery.Debit_Amount;
                                    TrailBalanceDetail."Credit Amount" += GLQuery.Credit_Amount;
                                end;

                                GLQuery.Close();
                                gleEnd.SetRange("G/L Account No.", TrailBalanceData."No.");
                                gleEnd.SetRange("Posting Date", 0D, EndingDate);
                                gleEnd.SetRange("Global Dimension 1 Code", Dim1.Code);
                                gleEnd.SetRange("Global Dimension 2 Code", Dim2.Code);
                                gleEnd.CalcSums(Amount);

                                TrailBalanceDetail."End Balance" := gleEnd.Amount;
                                TrailBalanceDetail.Insert();

                            until Dim2.Next() = 0;
                    until Dim1.Next() = 0;

                for i := 1 to 2 do begin
                    Dim1.Reset();
                    Dim1.SetRange("Global Dimension No.", i);
                    if Dim1.FindSet() then
                        repeat

                            GLQuery.SetRange(No, TrailBalanceData."No.");
                            if i = 1 then begin
                                GLQuery.SetRange(Global_Dimension_1_Code, Dim1.Code);
                                GLQuery.SetFilter(Global_Dimension_2_Code, '=%1', '');
                            end else begin
                                GLQuery.SetFilter(Global_Dimension_1_Code, '=%1', '');
                                GLQuery.SetRange(Global_Dimension_2_Code, Dim1.Code);
                            end;
                            GLQuery.SetRange(Posting_Date, StartingDate, EndingDate);
                            GLQuery.Open();
                            while GLQuery.Read() do begin

                                if TrailBalanceDetail.Get(GLQuery.No, GLQuery.Global_Dimension_1_Code, GLQuery.Global_Dimension_2_Code) then begin
                                    TrailBalanceDetail."Debit Amount" += GLQuery.Debit_Amount;
                                    TrailBalanceDetail."Credit Amount" += GLQuery.Credit_Amount;
                                    TrailBalanceDetail.Modify();

                                end else begin
                                    TrailBalanceDetail.Init();
                                    TrailBalanceDetail."G/L Account No." := GLQuery.No;
                                    TrailBalanceDetail."Global Dimension 1 Code" := GLQuery.Global_Dimension_1_Code;
                                    TrailBalanceDetail."Global Dimension 2 Code" := GLQuery.Global_Dimension_2_Code;

                                    gle.SetRange("G/L Account No.", GLQuery.No);
                                    gle.SetRange("Posting Date", 0D, CalcDate('-1D', StartingDate));
                                    gle.SetRange("Global Dimension 1 Code", GLQuery.Global_Dimension_1_Code);
                                    gle.SetRange("Global Dimension 2 Code", GLQuery.Global_Dimension_2_Code);
                                    gle.CalcSums(Amount);

                                    TrailBalanceDetail."Previous Balance" := gle.Amount;
                                    TrailBalanceDetail."Debit Amount" := GLQuery.Debit_Amount;
                                    TrailBalanceDetail."Credit Amount" := GLQuery.Credit_Amount;

                                    gleEnd.SetRange("G/L Account No.", GLQuery.No);
                                    gleEnd.SetRange("Posting Date", 0D, EndingDate);
                                    gleEnd.SetRange("Global Dimension 1 Code", GLQuery.Global_Dimension_1_Code);
                                    gleEnd.SetRange("Global Dimension 2 Code", GLQuery.Global_Dimension_2_Code);
                                    gleEnd.CalcSums(Amount);

                                    TrailBalanceDetail."End Balance" := gleEnd.Amount;
                                    TrailBalanceDetail.Insert();
                                end;
                            end;
                            GLQuery.Close();

                        until Dim1.Next() = 0;
                end;
            end;

        }
        dataitem(Dimension1; "Dimension Value")
        {
            column(Dim1Code; Code)
            {
                IncludeCaption = true;
            }
            column(Dim1Name; "Name")
            {
                IncludeCaption = true;
            }
        }
        dataitem(Dimension2; "Dimension Value")
        {
            column(Dim2Code; Code)
            {
                IncludeCaption = true;
            }
            column(Dim2Name; "Name")
            {
                IncludeCaption = true;
            }

        }
    }
    requestpage
    {
        SaveValues = true;
        AboutTitle = 'MNP Trail Balance';
        AboutText = 'This report shows the MNP Trail Balance';

        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(StartingDate; StartingDate)
                    {
                        ApplicationArea = All;
                        Caption = 'Starting Date';
                        ShowMandatory = true;
                    }
                    field(EndingDate; EndingDate)
                    {
                        ApplicationArea = All;
                        Caption = 'Ending Date';
                        ShowMandatory = true;
                    }
                }
            }
        }
    }

    rendering
    {
        layout(TrailBalanceExcelLayout)
        {
            Type = Excel;
            LayoutFile = './ReportLayout/TrailBalanceLayout.xlsx';
            Caption = 'MNP Trail Balance';
            Summary = 'This report shows the MNP Trail Balance';
        }
        layout(TrailBalanceRdlLayout)
        {
            Type = RDLC;
            LayoutFile = './ReportLayout/TrailBalanceLayout.rdl';
            Caption = 'MNP Trail Balance rdl';
            Summary = 'This report shows the MNP Trail Balance';
        }
        layout(TrailBalanceExcelLayoutNew)
        {
            Type = Excel;
            LayoutFile = './ReportLayout/TrailBalanceLayoutNew.xlsx';
            Caption = 'MNP Trail Balance New';
            Summary = 'This report shows the MNP Trail Balance New';
        }
    }
    labels
    {
        TrailBalanceLCY = 'Trail Balance (LCY)';
        TrailBalanceACYSheet = 'Trail Balance (ACY)';
        TrailBalanceACY = 'Trail Balance (Additional Reporting Currency)';
        DataRetived = 'Data Retrived';
    }

    var
        PreBalance: Decimal;
        tmpBalance: Decimal;
        tmpBalanceDebit: Decimal;
        tmpBalanceCredit: Decimal;
        StartingDate: Date;
        EndingDate: Date;

    trigger OnPreReport()
    var
        TrailBal: Record "MNP TrailBalancebuffer";
    begin
        TrailBal.deleteAll();
    end;
}
