codeunit 50111 "MNB Azure Blob Storage"
{
    trigger OnRun()
    begin

    end;

    internal procedure ListContainers(): Text

    var

        IntegrationSetup: Record "MNB ABS Integration Setup";

        ABSContainer: Record "ABS Container";

        ABSContainerClient: Codeunit "ABS Container Client";

        StorageServiceAuthorization: Codeunit "Storage Service Authorization";

        Authorization: Interface "Storage Service Authorization";

    begin
        IntegrationSetup.Get();
        Authorization := StorageServiceAuthorization.CreateSharedKey(IntegrationSetup."Storage Key");
        ABSContainerClient.Initialize(IntegrationSetup."Azure Account Name", Authorization);
        ABSContainerClient.ListContainers(ABSContainer);
        if Page.RunModal(Page::"MNB Azure Containers", ABSContainer) = Action::LookupOK then
            exit(ABSContainer.Name);
    end;


    procedure ImportFileToAzureBlobStorage(FileName: Text; var IStream: InStream)
    var
        IntegrationSetup: Record "MNB ABS Integration Setup";
        ABSBlobClient: Codeunit "ABS Blob Client";
        StorageServiceAuthorization: Codeunit "Storage Service Authorization";
        Authorization: Interface "Storage Service Authorization";
    begin

        IntegrationSetup.Get();
        Authorization := StorageServiceAuthorization.CreateSharedKey(IntegrationSetup."Storage Key");

        ABSBlobClient.Initialize(IntegrationSetup."Azure Account Name", IntegrationSetup."Container Name", Authorization);

        ABSBlobClient.PutBlobBlockBlobStream(FileName, IStream);

    end;

    internal procedure DownloadFileFromAzureBlobStorage()

    var
        ABSContainerContent: Record "ABS Container Content";

        ABSBlobClient: Codeunit "ABS Blob Client";

        StorageServiceAuthorization: Codeunit "Storage Service Authorization";

        Authorization: Interface "Storage Service Authorization";
        IntegrationSetup: Record "MNB ABS Integration Setup";
    begin

        IntegrationSetup.Get();

        IntegrationSetup.TestField("Container Name");

        Authorization := StorageServiceAuthorization.CreateSharedKey(IntegrationSetup."Storage Key");

        ABSBlobClient.Initialize(IntegrationSetup."Azure Account Name", IntegrationSetup."Container Name", Authorization);

        ABSBlobClient.ListBlobs(ABSContainerContent);

        if Page.RunModal(Page::"MNB Container Content", ABSContainerContent) = Action::LookupOK then
            ABSBlobClient.GetBlobAsFile(ABSContainerContent.Name);

    end;
}