using SupplierContracts as service from '../../srv/service-models';

annotate service.SupplierContracts with @(
    UI.SelectionFields : [
        identifier
    ],
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
            Value : toSupplier.supplierID
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

    UI.HeaderInfo : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : 'Supplier Contract',
        TypeNamePlural : 'Supplier Contracts',
        Title          : {
            $Type : 'UI.DataField',
            Value : identifier
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : description
        }
    },

    UI.HeaderFacets : [
        {
            $Type  : 'UI.ReferenceFacet',
            Target : '@UI.DataPoint#Date'
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Target : '@UI.DataPoint#StartDate'
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Target : '@UI.DataPoint#EndDate'
        },
    ],

    UI.DataPoint #Date : {
        Title : 'Contract Date',        
        Value : date,
        ![@UI.Emphasized],
    },
    UI.DataPoint #StartDate : {
        Title : 'Contract Start Date',        
        Value : startdate,
        ![@UI.Emphasized],
    },
    UI.DataPoint #EndDate : {
        Title : 'Contract End Date',        
        Value : enddate,
        ![@UI.Emphasized],
    },

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
            },
            {
                $Type : 'UI.DataField',
                Label : 'Note',
                Value : renewalNote
            },
            {
                $Type : 'UI.DataField',
                Label : 'Renewal Reminder in',
                Value : renewalReminderCount
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
            },
            {
                $Type : 'UI.DataField',
                Label : 'Note',
                Value : cancellationNote
            },
            {
                $Type : 'UI.DataField',
                Label : 'Cancellation Reminder in',
                Value : cancellationReminderCount
            } 
        ],
    },
    UI.FieldGroup #Recurrence : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Recurrence on day',
                Value : recurrenceDay 
            },
            {
                $Type : 'UI.DataField',
                Label : 'Recurrence Pattern',
                Value : recurrencePattern_code 
            },
            {
                $Type : 'UI.DataField',
                Label : 'Next Execution',
                Value : nextExecutionDate 
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
            },],
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'RecurrencePattern',
            Label : 'Recurring Invoicing',
            Target : '@UI.FieldGroup#Recurrence',
        },
    ]
);

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
        },
        {
            $Type             : 'UI.DataField',
            Value             : productCategory,
            Label             : 'Product Category',
        },
        {
            $Type             : 'UI.DataField',
            Value             : toProductCategory.prdouctCategoryID,
            @UI.Hidden        : true
        },
        {
            $Type             : 'UI.DataField',
            Value             : toProductCategory.description,
            @UI.Hidden        : true
        },
        {
            $Type             : 'UI.DataField',
            Value             : quantity,
            Label             : 'Quantity',
        },
        {
            $Type             : 'UI.DataField',
            Value             : uom_code,
            Label             : 'Unit',
        },
        {
            $Type             : 'UI.DataField',
            Value             : netPrice,
            Label             : 'Net Price',
        },
        {
            $Type             : 'UI.DataField',
            Value             : netPriceCurrency_code,
            Label             : 'Currency',
        },
        {
            $Type             : 'UI.DataField',
            Value             : netValue,
            Label             : 'Net Value',
        },
        {
            $Type             : 'UI.DataField',
            Value             : netValueCurrency_code,
            Label             : 'Currency',
        },
    ]
});

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
        },
        Common.Text :   toSupplier.firstLineName 
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
    currency @ (
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
            Text : currency.name
        }
    );
    recurrencePattern @ (
        Common: {
            ValueListWithFixedValues,
            ValueList : {
                SearchSupported : true,
                CollectionPath  : 'TimeMeasurement',
                Parameters      : [{
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : recurrencePattern_code,
                    ValueListProperty : 'code'
                }
                ]
            },
            Text : recurrencePattern.descr,
            TextArrangement : #TextOnly 
        }
    );
}

// Value help on items
annotate service.Items with {     
    uom @ (
        Common: {
            ValueListWithFixedValues,
            ValueList : {
                SearchSupported : true,
                CollectionPath  : 'UnitOfMeasurement',
                Parameters      : [{
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : uom_code,
                    ValueListProperty : 'code'
                }
                ]
            },
            Text : uom.descr,
            TextArrangement : #TextOnly 
        }
    );
    netValueCurrency @  (
        Common: {
            ValueListWithFixedValues,
            ValueList : {
                SearchSupported : true,
                CollectionPath  : 'Currencies',
                Parameters      : [{
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : netValueCurrency_code,
                    ValueListProperty : 'code'
                }
                ]
            },
            Text : netValueCurrency.name,
            TextArrangement : #TextOnly 
        }
    );
    netPriceCurrency @  (
        Common: {
            ValueListWithFixedValues,
            ValueList : {
                SearchSupported : true,
                CollectionPath  : 'Currencies',
                Parameters      : [{
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : netPriceCurrency_code,
                    ValueListProperty : 'code'
                }
                ]
            },
            Text : netPriceCurrency.name,
            TextArrangement : #TextOnly 
        }
    );
    productCategory @ (
        Common.ValueList: {
            Label: 'Product Categories',
            CollectionPath: 'ProductCategories',
            Parameters: [
                { $Type: 'Common.ValueListParameterInOut',
                    LocalDataProperty: productCategory,
                    ValueListProperty: 'prdouctCategoryID'
                },
                { $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'prdouctCategoryID'
                }
            ]
        }
    )    
}

annotate service.Suppliers with {
    supplierID         @(
        title: 'ID',
        Common.Text: firstLineName
    );
    firstLineName    @title: 'Supplier Name';
}

annotate service.ProductCategories with {
    prdouctCategoryID         @(
        title: 'ID',
        Common.Text: productCatergory.description
    );
    description    @title: 'Category Name';
}

annotate service.SupplierContracts with @Capabilities.SearchRestrictions.Searchable : false;