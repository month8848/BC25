codeunit 50118 "MNB Import Items Json"

{

    procedure ImportItemsFromJson()

    var

        JSONBuffer, JSONBufferItems, JSONBufferVariants : Record "JSON Buffer" temporary;

        IStream: InStream;

        FileName: Text;

        ItemNo, ItemDescription, BaseUnitOfMeasure, VariantCode, VariantDescription : Text;

        JsonTextBuilder: TextBuilder;

    begin
        UploadIntoStream('', '', '', FileName, IStream);

        GetStreamText(IStream, JsonTextBuilder);

        JSONBuffer.ReadFromText(JsonTextBuilder.ToText());

        if JSONBuffer.FindArray(JSONBufferItems, 'items') then
            repeat

                JSONBufferItems.GetPropertyValue(ItemNo, 'number');

                JSONBufferItems.GetPropertyValue(ItemDescription, 'name');

                JSONBufferItems.GetPropertyValue(BaseUnitOfMeasure, 'baseUnitOfMeasure');

                CreateItem(ItemNo, ItemDescription, BaseUnitOfMeasure);

                if JSONBufferItems.FindArray(JSONBufferVariants, 'variants') then
                    repeat

                        JSONBufferVariants.GetPropertyValue(VariantCode, 'code');

                        JSONBufferVariants.GetPropertyValue(VariantDescription, 'description');

                        CreateVariant(ItemNo, VariantCode, VariantDescription);

                    until JSONBufferVariants.Next() = 0;

            until JSONBufferItems.Next() = 0;

    end;



    local procedure GetStreamText(var IStream: InStream; var JsonText: TextBuilder)

    var

        TempText: Text;

    begin

        while not (IStream.EOS) do begin

            IStream.ReadText(TempText);

            JsonText.Append(TempText);

        end;

    end;



    local procedure CreateItem(ItemNo: Text; ItemDescription: Text; BaseUnitOfMeasure: Text)

    var

        Item: Record Item;

    begin

        Item.Init();

        Item.Validate("No.", ItemNo);

        Item.Validate("Description", ItemDescription);

        Item.Insert(true);

        Item.Validate("Base Unit of Measure", BaseUnitOfMeasure);

        Item.Modify(true);

    end;

    local procedure CreateVariant(ItemNo: Text; VariantCode: Text; VariantDescription: Text)

    var

        ItemVariant: Record "Item Variant";

    begin

        ItemVariant.Init();

        ItemVariant.Validate("Item No.", ItemNo);

        ItemVariant.Validate("Code", VariantCode);

        ItemVariant.Validate("Description", VariantDescription);

        ItemVariant.Insert(true);

    end;
}