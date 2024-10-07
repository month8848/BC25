codeunit 50101 "MNB Calculate Risk Item" implements MNBICalculateRisk
{
    procedure GetRiskScore(var Item: Record Item)
    begin
        Item."MNB Risk Score" := Item."MNB Risk Impact" * Item."MNB Risk Probability";
    end;

    procedure GetEditableRiskImpact(var Item: Record Item): Boolean
    begin
        if Item."MNB Item Risk Calc. Method" = Item."MNB Item Risk Calc. Method"::Item then
            exit(true)
        else
            exit(false);
    end;
}