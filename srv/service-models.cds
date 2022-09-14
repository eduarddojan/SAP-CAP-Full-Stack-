using { bc.hack2build.suppliercontract as armodels } from '../db/entity_models';
using sap from '@sap/cds/common';

service SupplierContracts {
    @odata.draft.enabled
    entity SupplierContracts as select from armodels.SupplierContracts;
}