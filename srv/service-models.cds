using { bc.hack2build.suppliercontract as armodels } from '../db/entity_models';
using sap from '@sap/cds/common';

service SupplierContracts {
    @odata.draft.enabled
    entity SupplierContracts as select from armodels.SupplierContracts
        mixin {
            toSupplier: Association to RemoteSupplier.SupplierCollection on toSupplier.InternalID = $projection.supplierID
        }
        into {
            *,
            toSupplier
        }
        actions {

        }
}

// Remote ByD Services

using { byd_suppliers as RemoteSupplier } from './external/byd_suppliers';

extend service SupplierContracts with {
    entity Suppliers as projection on RemoteSupplier.SupplierCollection {
        key ObjectID as ID,
        InternalID as supplierID,
        LifeCycleStatusCode as status,
        FirstLineName as firstLineName,
        SecondLineName as secondLineName,
        SortingFormattedName as formattedName
    }
};