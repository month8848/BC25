enum 50100 "MNB Item Risk Calc. Method" implements "MNBICalculateRisk"
{
    Extensible = true;
    DefaultImplementation = MNBICalculateRisk = "MNB Calculate Risk Item";

    value(0; Item)
    {
        Caption = 'Item';
        Implementation = MNBICalculateRisk = "MNB Calculate Risk Item";
    }
    value(1; "Item Category")
    {
        Caption = 'Item Category';
        Implementation = MNBICalculateRisk = "MNB Calculate Risk Cat";
    }
    value(2; "Item Dimension")
    {
        Caption = 'Item Dimension';
        Implementation = MNBICalculateRisk = "MNB Calculate Risk Dim";
    }
}