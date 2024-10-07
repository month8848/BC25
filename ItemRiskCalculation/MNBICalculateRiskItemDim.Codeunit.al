codeunit 50107 "MNB Calculate Risk Dim" implements MNBICalculateRisk
{
    procedure GetRiskScore(var Item: Record Item)
    var
        ItemCategory: Record "Item Category";
    begin
        if not ItemCategory.Get(Item."Item Category Code") then begin
            Item."MNB Risk Score" := 0;
            exit;
        end;
        Item."MNB Risk Impact" := 0;
        Item."MNB Risk Score" := ItemCategory."MNB Risk Impact" * Item."MNB Risk Probability";
    end;

    procedure GetEditableRiskImpact(var Item: Record Item): Boolean
    begin
        if Item."MNB Item Risk Calc. Method" = Item."MNB Item Risk Calc. Method"::Item then
            exit(true)
        else
            exit(false);
    end;
}