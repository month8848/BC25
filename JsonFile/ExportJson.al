codeunit 50127 "MNB Export Customers Json"

{

    internal procedure GenerateJsonForCustomers()

    var

        Customer: Record Customer;

        JsonTextReaderWriter: Codeunit "Json Text Reader/Writer";

        TempBlob: Codeunit "Temp Blob";

        OSteam: OutStream;

        FileName: Text;

        FileNameTxt: Label 'customers.json';
        ShiptoAddress: Record "Ship-to Address";

    begin

        JsonTextReaderWriter.WriteStartObject('');

        JsonTextReaderWriter.WriteStartArray('customers');
        Customer.SetLoadFields("No.", Name, "Privacy Blocked", Balance, "Credit Limit (LCY)");

        Customer.SetAutoCalcFields(Balance);

        if Customer.FindSet() then
            repeat

                JsonTextReaderWriter.WriteStartObject('');
                JsonTextReaderWriter.WriteStringProperty('name', Customer.Name);

                JsonTextReaderWriter.WriteStringProperty('number', Customer."No.");

                JsonTextReaderWriter.WriteBooleanProperty('blocked', Customer."Privacy Blocked");

                JsonTextReaderWriter.WriteNumberProperty('balance', Customer.Balance);

                JsonTextReaderWriter.WriteNumberProperty('creditLimit', Customer."Credit Limit (LCY)");


                ShiptoAddress.SetRange("Customer No.", Customer."No.");
                if ShiptoAddress.FindSet() then begin

                    JsonTextReaderWriter.WriteStartArray('shiptoaddress');
                    repeat
                        JsonTextReaderWriter.WriteStartObject('');
                        JsonTextReaderWriter.WriteStringProperty('address', ShiptoAddress.Address);
                        JsonTextReaderWriter.WriteEndObject();
                    until ShiptoAddress.Next() = 0;

                    JsonTextReaderWriter.WriteEndArray();
                    JsonTextReaderWriter.WriteEndObject();
                end else
                    JsonTextReaderWriter.WriteEndObject();

            until Customer.Next() = 0;

        JsonTextReaderWriter.WriteEndArray();

        JsonTextReaderWriter.WriteEndObject();



        TempBlob.CreateOutStream(OSteam);

        OSteam.WriteText(JsonTextReaderWriter.GetJSonAsText());

        FileName := FileNameTxt;

        DownloadFromStream(TempBlob.CreateInStream(), '', '', '', FileName);

    end;
}