namespace ALProject.ALProject;

page 50101 "CDS crcff_Item"
{
    ApplicationArea = All;
    Caption = 'CDS crcff_Item';
    PageType = List;
    SourceTable = "CDS crcff_Item";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(crcff_ItemNo; Rec.crcff_ItemNo)
                {
                    ToolTip = 'Specifies the value of the Item No. field.', Comment = '%';
                }
                field(crcff_Description; Rec.crcff_Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(crcff_ItemCategory; Rec.crcff_ItemCategory)
                {
                    ToolTip = 'Specifies the value of the Item Category field.', Comment = '%';
                }
                field(crcff_UnitPrice; Rec.crcff_UnitPrice)
                {
                    ToolTip = 'Specifies the value of the Unit Price field.', Comment = '%';
                }
                field(crcff_VendorNo; Rec.crcff_VendorNo)
                {
                    ToolTip = 'Specifies the value of the Vendor No. field.', Comment = '%';
                }
            }
        }
    }
}
