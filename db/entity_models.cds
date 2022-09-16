namespace bc.hack2build.suppliercontract;

using {
    sap,
    managed,
    cuid,
    Currency
} from '@sap/cds/common';


// Supplier Contract
entity SupplierContracts : managed, cuid {
    identifier  :   String;
    description :   String;
    date        :   DateTime;
    startdate   :   DateTime;
    enddate     :   DateTime;
    supplierID  :   String; 
}

