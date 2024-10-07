pageextension 50100 "MNP Item Card" extends "Item Card"
{
    layout
    {
        // Add changes to page layout here
        addlast(Item)
        {
            field("MNB Item Risk Calc. Method"; rec."MNB Item Risk Calc. Method")
            {
                ApplicationArea = All;

                trigger OnValidate()

                begin

                    CurrPage.Update(true);

                end;
            }
            field("MNB Risk Impact"; rec."MNB Risk Impact")
            {
                ApplicationArea = All;
                Editable = MNBRiskImpactEditable;
            }
            field("MNB Risk Probability"; rec."MNB Risk Probability")
            {
                ApplicationArea = All;
            }
            field("MNB Risk Score"; rec."MNB Risk Score")
            {
                ApplicationArea = All;
            }
            field(MNBExternalInventoryField; ExternalInventory)
            {
                ApplicationArea = All;
                Caption = 'External Inventory';
                ToolTip = 'Displays the external inventory for the item.';
                Editable = false;

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }


    trigger OnAfterGetCurrRecord()
    var
        MNBICalculateRisk: Interface "MNBICalculateRisk";
        TaskParameters: Dictionary of [Text, Text];
    begin
        MNBICalculateRisk := Rec."MNB Item Risk Calc. Method";
        MNBRiskImpactEditable := MNBICalculateRisk.GetEditableRiskImpact(Rec);


        TaskParameters.Add('ItemNo', Rec."No.");
        CurrPage.EnqueueBackgroundTask(BackgroundTaskId, Codeunit::"MNB Check Item Availability", TaskParameters)
    end;

    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    begin
        Evaluate(ExternalInventory, Results.Get('ExternalInventory'));
    end;

    var
        myInt: Integer;
        MNBRiskImpactEditable: Boolean;
        ExternalInventory: Decimal;
        BackgroundTaskId: Integer;
}