page 50112 "MNB ABS Integration Setup"

{



    PageType = Card;

    SourceTable = "MNB ABS Integration Setup";

    Caption = 'Integration Setup';

    InsertAllowed = false;

    DeleteAllowed = false;

    UsageCategory = Administration;

    ApplicationArea = All;

    layout

    {

        area(content)

        {

            group(AzureBlobStorage)

            {

                Caption = 'Azure Blob Storage';

                field("Azure Account Name"; Rec."Azure Account Name")

                {

                    ToolTip = 'Specifies the name of the Azure Blob Storage account. The name is unique within the Azure environment and is used to access the storage account.';

                }

                field("Container Name"; Rec."Container Name")

                {

                    ToolTip = 'Specifies the name of the container in the Azure Blob Storage account. The container is used to store the files that are used by the integration service.';

                    Editable = false;

                }

                field("Storage Key"; Rec."Storage Key")

                {

                    ToolTip = 'Specifies the key that is used to access the Azure Blob Storage account. The key is used to authenticate the user and to access the storage account. The key is unique within the Azure environment and is used to access the storage account. The key is used to authenticate the user and to access the storage account. The key is unique within the Azure environment and is used to access the storage account.';

                }

            }

        }


    }

    actions
    {
        area(Processing)
        {

            action(ListContainers)

            {

                Caption = 'List Containers';

                Image = ShowList;

                ToolTip = 'Show list of containers';

                ApplicationArea = All;

                // Enabled = Rec."Integration Service" = Rec."Integration Service"::"Azure Blob Storage";

                trigger OnAction()

                var

                    MNBAzureBlobStorage: Codeunit "MNB Azure Blob Storage";

                begin

                    Rec."Container Name" := MNBAzureBlobStorage.ListContainers();

                end;

            }

            action(ImportFileToAzureBlobStorage)

            {

                Caption = 'Import File';

                Image = Import;

                ToolTip = 'Import file to Azure Blob Storage';

                ApplicationArea = All;

                trigger OnAction()

                var

                    MNBAzureBlobStorage: Codeunit "MNB Azure Blob Storage";

                    IStream: InStream;

                    FileName: Text;

                begin

                    UploadIntoStream('', '', '', FileName, IStream);

                    MNBAzureBlobStorage.ImportFileToAzureBlobStorage(FileName, IStream);

                end;
            }
            action(DownloadFileFromAzureBlobStorage)

            {

                Caption = 'Download File';

                Image = Import;

                ToolTip = 'Download file from Azure Blob Storage';

                ApplicationArea = All;

                trigger OnAction()

                var

                    MNBAzureBlobStorage: Codeunit "MNB Azure Blob Storage";

                begin

                    MNBAzureBlobStorage.DownloadFileFromAzureBlobStorage();

                end;
            }
        }
    }

    trigger OnOpenPage()

    begin

        Rec.InsertIfNotExists();

    end;
}