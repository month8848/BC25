codeunit 50137 "MNB Object And Fields Mgt."

{

    /// <summary> 
    /// Selects the table from the list of all tables 
    /// </summary> 
    /// <param name="Result">Object that has been selected</param> 
    /// <returns>True if object has been selected</returns> 

    internal procedure SelectObject(var Result: Record AllObjWithCaption): Boolean

    var

        AllObjects: Record AllObjWithCaption;

        Objects: Page Objects;

    begin

        AllObjects.FilterGroup(2);

        AllObjects.SetRange("Object Type", AllObjects."Object Type"::Table);

        AllObjects.FilterGroup(0);



        Objects.SetRecord(AllObjects);

        Objects.SetTableView(AllObjects);

        Objects.LookupMode := true;



        if Objects.RunModal() = Action::LookupOK then begin

            Objects.GetRecord(Result);

            exit(true);

        end;



        exit(false);

    end;



    /// <summary> 
    /// Allows to select fields from the table 
    /// </summary> 
    /// <param name="TableNo">Number of table from which the field should be selected</param> 
    /// <param name="SelectedField">Field that has been selected</param> 
    /// <returns>True if field has been selected</returns> 


    procedure SelectFieldNo(TableNo: Integer; var SelectedField: Record Field): Boolean

    var

        FieldSelection: Codeunit "Field Selection";

    begin

        SelectedField.FilterGroup(2);

        SelectedField.SetRange(TableNo, TableNo);
        SelectedField.SetFilter(Type, '%1|%2', SelectedField.Type::Text, SelectedField.Type::Code);

        SelectedField.FilterGroup(0);

        if FieldSelection.Open(SelectedField) then
            exit(true);

        exit(false);

    end;
}