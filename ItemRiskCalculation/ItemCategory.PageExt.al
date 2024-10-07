pageextension 50107 "MNB Item Category Card" extends "Item Category Card"

{

    layout

    {

        addlast(General)

        {

            field("MNB Risk Impact"; Rec."MNB Risk Impact")

            {

                ApplicationArea = All;

                ToolTip = 'Enter the risk impact for the item category.';

            }

        }

    }

}