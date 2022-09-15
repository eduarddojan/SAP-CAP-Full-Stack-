/* checksum : 04bb9499bd4e79869347feea12f20faa */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
service byd_suppliers {};

@cds.persistence.skip : true
@sap.creatable : 'true'
@sap.updatable : 'true'
@sap.deletable : 'true'
entity byd_suppliers.SupplierCollection {
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.filterable : 'true'
  key ObjectID : String(70);
  @sap.creatable : 'true'
  @sap.updatable : 'true'
  @sap.filterable : 'true'
  InternalID : String(10);
  @sap.creatable : 'true'
  @sap.updatable : 'true'
  @sap.filterable : 'true'
  LifeCycleStatusCode : String(2);
  @sap.creatable : 'true'
  @sap.updatable : 'true'
  @sap.filterable : 'true'
  FirstLineName : String(40);
  @sap.creatable : 'true'
  @sap.updatable : 'true'
  @sap.filterable : 'true'
  SecondLineName : String(40);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.filterable : 'true'
  SortingFormattedName : String(80);
};

@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.semantics : 'fixed-values'
entity byd_suppliers.SupplierLifeCycleStatusCodeCollection {
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.filterable : 'true'
  key Code : LargeString;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.filterable : 'true'
  Description : LargeString;
};

