using SupplierContracts as service from '../../srv/service-models';

annotate service.SupplierContracts with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'identifier',
            Value : identifier,
        },
        {
            $Type : 'UI.DataField',
            Label : 'description',
            Value : description,
        },
        {
            $Type : 'UI.DataField',
            Label : 'date',
            Value : date,
        },
        {
            $Type : 'UI.DataField',
            Label : 'startdate',
            Value : startdate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'enddate',
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
                Label : 'identifier',
                Value : identifier,
            },
            {
                $Type : 'UI.DataField',
                Label : 'description',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Label : 'date',
                Value : date,
            },
            {
                $Type : 'UI.DataField',
                Label : 'startdate',
                Value : startdate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'enddate',
                Value : enddate,
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
    ]
);
