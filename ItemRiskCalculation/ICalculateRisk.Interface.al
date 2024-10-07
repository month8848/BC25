interface MNBICalculateRisk
{
    procedure GetRiskScore(var Item: Record Item);
    procedure GetEditableRiskImpact(var Item: Record Item): Boolean;
}