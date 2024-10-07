codeunit 50100 "MNB Calculate Item Risk Score"
{
    procedure SetItemRiskScore(var Item: Record Item)
    var
        ICalculateRisk: Interface MNBICalculateRisk;
    begin
        ICalculateRisk := Item."MNB Item Risk Calc. Method";
        ICalculateRisk.GetRiskScore(Item);
    end;
}