tableextension 50100 "WK Item" extends Item
{
    fields
    {
        // Add changes to table fields here
        field(50000; "MNB Item Risk Calc. Method"; Enum "MNB Item Risk Calc. Method")
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                CalculateItemRiskScore: Codeunit "MNB Calculate Item Risk Score";
            begin
                CalculateItemRiskScore.SetItemRiskScore(Rec);
            end;
        }
        field(50001; "MNB Risk Impact"; Integer)
        {
            DataClassification = ToBeClassified;
            MinValue = 0;

            trigger OnValidate()
            var
                IcalculateRisk: Interface "MNBICalculateRisk";
            begin
                IcalculateRisk := Rec."MNB Item Risk Calc. Method";
                IcalculateRisk.GetRiskScore(Rec);
            end;
        }
        field(50002; "MNB Risk Probability"; Integer)
        {
            DataClassification = ToBeClassified;
            MinValue = 0;

            trigger OnValidate()

            var

                CalculateItemRiskScore: Codeunit "MNB Calculate Item Risk Score";

            begin

                CalculateItemRiskScore.SetItemRiskScore(Rec);

            end;
        }
        field(50003; "MNB Risk Score"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}