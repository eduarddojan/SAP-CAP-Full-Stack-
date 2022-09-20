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
        };
        /*actions {

        }*/

    entity Items as projection on armodels.Items;
}



// Remote ByD Services
using { byd_suppliers as RemoteSupplier } from './external/byd_suppliers';

extend service SupplierContracts with {
    entity Suppliers as projection on RemoteSupplier.SupplierCollection {
        @readonly key ObjectID as ID,
        @readonly InternalID as supplierID,
        @readonly LifeCycleStatusCode as status,
        @readonly FirstLineName as firstLineName,
        @readonly SecondLineName as secondLineName,
        @readonly SortingFormattedName as formattedName
    }
};