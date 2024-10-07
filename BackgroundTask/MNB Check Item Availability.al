// This codeunit is used to call the Azure Function to get the inventory of the item
codeunit 50124 "MNB Check Item Availability"
{
    trigger OnRun()
    var
        TaskResults: Dictionary of [Text, Text];
    begin
        TaskResults.Add('ExternalInventory', GetExternalInventoryAzureFunction(Page.GetBackgroundParameters().Get('ItemNo')));
        Page.SetBackgroundTaskResult(TaskResults);
    end;

    local procedure GetExternalInventory(ItemNo: Code[20]): Text
    begin
        exit(Format(1005));
    end;


    // This function is used to call the Azure Function to get the inventory of the item
    procedure GetExternalInventoryAzureFunction(ItemNo: Code[20]): Text
    var
        AzureFunctionsAuthentication: Codeunit "Azure Functions Authentication";
        AzureFunctions: Codeunit "Azure Functions";
        AzureFunctionsResponse: Codeunit "Azure Functions Response";
        AzureFunctionsAuthenticationIn: Interface "Azure Functions Authentication";
        QueryDict: Dictionary of [Text, Text];
        ResponseTxt: Text;
        AzureFunctionUrlTxt: Label 'https://itemimporttobc.azurewebsites.net/api/GetItemsInventoryToBC?code=3xRDnOyU8rREMlK9j8C_Eg35xPsR9OxMGmG9t4ljef84AzFuHzO_Bw==', Locked = true;
    begin
        AzureFunctionsAuthenticationIn := AzureFunctionsAuthentication.CreateCodeAuth(AzureFunctionUrlTxt, '');
        QueryDict.Add('itemnumber', ItemNo);
        QueryDict.Add('secretkey', 'altraining');
        AzureFunctionsResponse := AzureFunctions.SendGetRequest(AzureFunctionsAuthenticationIn, QueryDict);
        AzureFunctionsResponse.GetResultAsText(ResponseTxt);
        exit(ResponseTxt);
    end;

}