namespace bc.hack2build.suppliercontract;

using {
    sap,
    managed,
    cuid,
    Currency
} from '@sap/cds/common';


// Supplier Contract
entity SupplierContracts : managed, cuid {
    identifier                  :   String;
    description                 :   String;
    date                        :   DateTime;
    startdate                   :   DateTime;
    enddate                     :   DateTime;
    supplierID                  :   String;
    statusCode                  :   Association to one SupplierContractStatusCodes;
    currency                    :   Association to one sap.common.Currencies;

    // Renewal section 
    renewalRuleCode             :   Association to one SupplierContractRenewalRuleCodes;
    renewalNote                 :   String;
    renewalReminderCount        :   Integer;

    // Cancellation section
    cancellationAgreementCode   :   Association to one SupplierContractCancellationAgreementCodes;
    cancellationNote            :   String;
    cancellationReminderCount   :   Integer;

    // Items
    Items                       :   Composition of many Items on Items.parent = $self;
}

entity Items : managed, cuid {
    parent              :   Association to SupplierContracts;
    identifer           :   String;
    description         :   String;
    productCategory     :   String;
    quantity            :   Integer;
    //uom               :   --> create additionl entity
    netPrice            :   Decimal;
    netPriceCurrency    :   Association to one sap.common.Currencies;
}

// Supplier contract status codes
entity SupplierContractStatusCodes : sap.common.CodeList {
        @Common.Text : {
            $value                 : descr,
            ![@UI.TextArrangement] : #TextOnly
        }
    key code : Integer default 0
}

// Supplier contract status codes
entity SupplierContractRenewalRuleCodes : sap.common.CodeList {
        @Common.Text : {
            $value                 : descr,
            ![@UI.TextArrangement] : #TextOnly
        }
    key code : Integer default 0
}

// Supplier contract status codes
entity SupplierContractCancellationAgreementCodes : sap.common.CodeList {
        @Common.Text : {
            $value                 : descr,
            ![@UI.TextArrangement] : #TextOnly
        }
    key code : Integer default 0
}