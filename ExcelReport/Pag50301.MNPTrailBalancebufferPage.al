namespace ALProject.ALProject;

page 50301 "MNP TrailBalancebuffer Page"
{
    ApplicationArea = All;
    Caption = 'MNP TrailBalancebuffer Page';
    PageType = List;
    SourceTable = "MNP TrailBalancebuffer";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("G/L Account No."; Rec."G/L Account No.")
                {
                    ToolTip = 'Specifies the value of the G/L Account No. field.', Comment = '%';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.', Comment = '%';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.', Comment = '%';
                }
                field("Previous Balance"; Rec."Previous Balance")
                {
                    ToolTip = 'Specifies the value of the Previous Balance field.', Comment = '%';
                }
                field("Debit Amount"; Rec."Debit Amount")
                {
                    ToolTip = 'Specifies the value of the Previous Balance field.', Comment = '%';
                }
                field("Credit Amount"; Rec."Credit Amount")
                {
                    ToolTip = 'Specifies the value of the Previous Balance field.', Comment = '%';
                }
                field("End Balance"; Rec."End Balance")
                {
                    ToolTip = 'Specifies the value of the Previous Balance field.', Comment = '%';
                }

            }
        }
    }
}