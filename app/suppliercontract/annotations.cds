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
            $Type       : 'UI.DataField',
            Value       : statusCode.descr,
            Label       : 'Status'
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
                Value : statusCode_code,
                Label : 'Status'
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
                Label : 'Currency',
                Value : currency_code,
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
    UI.FieldGroup #Renewal : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Renewal Rule',
                Value : renewalRuleCode_code
            } 
        ],
    },
    UI.FieldGroup #Cancellation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Cancellation Rule',
                Value : cancellationAgreementCode_code
            } 
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
        {
            $Type : 'UI.CollectionFacet',
            ID : 'RenewalCanellation',
            Label : 'Renewal and Cancellation',
            Facets : [{
                $Type  : 'UI.ReferenceFacet',
                Target : ![@UI.FieldGroup#Renewal],
                ID     : 'Renewal',
                Label : 'Renewal Agreement'
                },
                {
                    $Type  : 'UI.ReferenceFacet',
                    Target : ![@UI.FieldGroup#Cancellation],
                    ID     : 'Cancellation',
                    Label : 'Cancellation Agreement'
                }
            ]
        },
        {
            $Type  : 'UI.CollectionFacet',
            Label  : 'Items',
            ID     : 'Items',
            Facets : [{
                $Type  : 'UI.ReferenceFacet',
                Target : 'Items/@UI.LineItem',
                ID     : 'Items'
            }],
        }
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
    statusCode @ (
        Common: {
            ValueListWithFixedValues,
            ValueList : {
                SearchSupported : true,
                CollectionPath  : 'SupplierContractStatusCodes',
                Parameters      : [{
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : statusCode_code,
                    ValueListProperty : 'code'
                }
                ]
            },
            Text : statusCode.descr,
            TextArrangement : #TextOnly 
        }
    );
    renewalRuleCode @ (
        Common: {
            ValueListWithFixedValues,
            ValueList : {
                SearchSupported : true,
                CollectionPath  : 'SupplierContractRenewalRuleCodes',
                Parameters      : [{
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : renewalRuleCode_code,
                    ValueListProperty : 'code'
                }
                ]
            },
            Text : renewalRuleCode.descr,
            TextArrangement : #TextOnly 
        }
    );
    cancellationAgreementCode @ (
        Common: {
            ValueListWithFixedValues,
            ValueList : {
                SearchSupported : true,
                CollectionPath  : 'SupplierContractCancellationAgreementCodes',
                Parameters      : [{
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : cancellationAgreementCode_code,
                    ValueListProperty : 'code'
                }
                ]
            },
            Text : cancellationAgreementCode.descr,
            TextArrangement : #TextOnly 
        }
    );
    currency_code @ (
        Common: {
            ValueListWithFixedValues,
            ValueList : {
                SearchSupported : true,
                CollectionPath  : 'Currencies',
                Parameters      : [{
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : currency_code,
                    ValueListProperty : 'code'
                }
                ]
            },
            Text : currency_code.descr,
            TextArrangement : #TextOnly 
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

annotate service.Items with @(UI : {
    LineItem : [
        {
            $Type             : 'UI.DataField',
            Value             : identifer,
            Label             : 'ID',
        },
        {
            $Type             : 'UI.DataField',
            Value             : description,
            Label             : 'Description',
        }
    ]
});