table 50311 "CDS crcff_Item"
{
    ExternalName = 'crcff_item';
    TableType = CDS;
    Description = '';

    fields
    {
        field(1; crcff_ItemId; GUID)
        {
            ExternalName = 'crcff_itemid';
            ExternalType = 'Uniqueidentifier';
            ExternalAccess = Insert;
            Description = 'Unique identifier for entity instances';
            Caption = 'Item';
        }
        field(2; CreatedOn; Datetime)
        {
            ExternalName = 'createdon';
            ExternalType = 'DateTime';
            ExternalAccess = Read;
            Description = 'Date and time when the record was created.';
            Caption = 'Created On';
        }
        field(4; ModifiedOn; Datetime)
        {
            ExternalName = 'modifiedon';
            ExternalType = 'DateTime';
            ExternalAccess = Read;
            Description = 'Date and time when the record was modified.';
            Caption = 'Modified On';
        }
        field(25; statecode; Option)
        {
            ExternalName = 'statecode';
            ExternalType = 'State';
            ExternalAccess = Modify;
            Description = 'Status of the Item';
            Caption = 'Status';
            InitValue = " ";
            OptionMembers = " ",Active,Inactive;
            OptionOrdinalValues = -1, 0, 1;
        }
        field(27; statuscode; Option)
        {
            ExternalName = 'statuscode';
            ExternalType = 'Status';
            Description = 'Reason for the status of the Item';
            Caption = 'Status Reason';
            InitValue = " ";
            OptionMembers = " ",Active,Inactive;
            OptionOrdinalValues = -1, 1, 2;
        }
        field(29; VersionNumber; BigInteger)
        {
            ExternalName = 'versionnumber';
            ExternalType = 'BigInt';
            ExternalAccess = Read;
            Description = 'Version Number';
            Caption = 'Version Number';
        }
        field(30; ImportSequenceNumber; Integer)
        {
            ExternalName = 'importsequencenumber';
            ExternalType = 'Integer';
            ExternalAccess = Insert;
            Description = 'Sequence number of the import that created this record.';
            Caption = 'Import Sequence Number';
        }
        field(31; OverriddenCreatedOn; Date)
        {
            ExternalName = 'overriddencreatedon';
            ExternalType = 'DateTime';
            ExternalAccess = Insert;
            Description = 'Date and time that the record was migrated.';
            Caption = 'Record Created On';
        }
        field(32; TimeZoneRuleVersionNumber; Integer)
        {
            ExternalName = 'timezoneruleversionnumber';
            ExternalType = 'Integer';
            Description = 'For internal use only.';
            Caption = 'Time Zone Rule Version Number';
        }
        field(33; UTCConversionTimeZoneCode; Integer)
        {
            ExternalName = 'utcconversiontimezonecode';
            ExternalType = 'Integer';
            Description = 'Time zone code that was in use when the record was created.';
            Caption = 'UTC Conversion Time Zone Code';
        }
        field(34; crcff_ItemNo; Text[100])
        {
            ExternalName = 'crcff_itemno';
            ExternalType = 'String';
            Description = '';
            Caption = 'Item No.';
        }
        field(35; crcff_UnitPrice; Decimal)
        {
            ExternalName = 'crcff_unitprice';
            ExternalType = 'Money';
            Description = '';
            Caption = 'Unit Price';
        }
        field(38; ExchangeRate; Decimal)
        {
            ExternalName = 'exchangerate';
            ExternalType = 'Decimal';
            ExternalAccess = Read;
            Description = 'Exchange rate for the currency associated with the entity with respect to the base currency.';
            Caption = 'Exchange Rate';
        }
        field(39; crcff_unitprice_Base; Decimal)
        {
            ExternalName = 'crcff_unitprice_base';
            ExternalType = 'Money';
            ExternalAccess = Read;
            Description = 'Value of the Unit Price in base currency.';
            Caption = 'Unit Price (Base)';
        }
        field(40; crcff_Description; Text[100])
        {
            ExternalName = 'crcff_description';
            ExternalType = 'String';
            Description = '';
            Caption = 'Description';
        }
        field(41; crcff_ItemCategory; Text[100])
        {
            ExternalName = 'crcff_itemcategory';
            ExternalType = 'String';
            Description = '';
            Caption = 'Item Category';
        }
        field(42; crcff_VendorNo; Text[100])
        {
            ExternalName = 'crcff_vendorno';
            ExternalType = 'String';
            Description = '';
            Caption = 'Vendor No.';
        }
    }
    keys
    {
        key(PK; crcff_ItemId)
        {
            Clustered = true;
        }
        key(Name; crcff_ItemNo)
        {
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; crcff_ItemNo)
        {
        }
    }
}