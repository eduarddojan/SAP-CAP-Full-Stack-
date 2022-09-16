using SupplierContracts as service from '../../srv/service-models';

annotate service.SupplierContracts with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : identifier,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Description',
            Value : description,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Supplier',
            Value : toSupplier.supplierID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Date',
            Value : date,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Start Date',
            Value : startdate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'End Date',
            Value : enddate,
        },
        
    ]
);
annotate service.SupplierContracts with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'ID',
                Value : identifier,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Date',
                Value : date,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Start Date',
                Value : startdate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'End Date',
                Value : enddate,
            },
            
        ],
    },
    UI.FieldGroup #SupplerInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Supplier ID',
                Value : supplierID
            },
            {
                $Type : 'UI.DataField',
                Label : 'Supplier',
                Value : toSupplier.supplierID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Supplier Name',
                Value : toSupplier.firstLineName,
            },
            
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'SupplerInformation',
            Label : 'Supplier Information',
            Target : '@UI.FieldGroup#SupplerInformation',
        },
    ]
);

// Annotations for value help

annotate service.SupplierContracts with {
     supplierID @(
        Common.ValueList: {
            Label: 'Suppliers',
            CollectionPath: 'Suppliers',
            Parameters: [
                { $Type: 'Common.ValueListParameterInOut',
                    LocalDataProperty: supplierID,
                    ValueListProperty: 'supplierID'
                },
                { $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'firstLineName'
                }
            ]
        }
    );
}

annotate service.Suppliers with {
    supplierID         @(
        title: 'ID',
        Common.Text: firstLineName
    );
    firstLineName    @title: 'Supplier Name';
}

annotate service.SupplierContracts with @Capabilities.SearchRestrictions.Searchable : false;