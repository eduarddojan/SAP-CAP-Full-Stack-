const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {

    

    this.on('READ', 'Suppliers', async req => {
        const suppliers = await cds.connect.to('byd_suppliers');
        return suppliers.run(req.query);
    });

    this.on('READ', 'ProductCategories', async req => {
        const prod_categories = await cds.connect.to('byd_product_categories');
        return prod_categories.run(req.query);
    });

    // Risks?$expand=supplier
    this.on("READ", 'SupplierContracts', async (req, next) => {

        const suppliers = await cds.connect.to('byd_suppliers');

        var expandIndex = -1;
        // Check the if the object exists before running the findIndex-function
        if(req){
            if(req.query){                
                if(req.query.SELECT){
                    if(req.query.SELECT.columns){
                        expandIndex = req.query.SELECT.columns.findIndex( ({ expand, ref }) => expand && ref[0] === "toSupplier" );
                    }
                }
            }
        }
        if (expandIndex < 0) return next();
        // Remove expand from query
        req.query.SELECT.columns.splice(expandIndex, 1);

        // Return supplierID
        if (!req.query.SELECT.columns.find(
            column => column.ref.find((ref) => ref == "supplierID"))
        ) req.query.SELECT.columns.push({ ref: ["supplierID"] });

        const supplierContracts = await next();

        const asArray = x => Array.isArray(x) ? x : [ x ];

        // Request all associated suppliers
        const supplierIds = asArray(supplierContracts).map(supplierContract => supplierContract.supplierID);
        const suppliers_list = await suppliers.run(SELECT.from('SupplierContracts.Suppliers').where({ supplierID: supplierIds }));

        // Convert in a map for easier lookup
        const suppliersMap = {};
        for (const supplier of suppliers_list)
            suppliersMap[supplier.supplierID] = supplier;

        // Add suppliers to result
        for (const supplierContract of asArray(supplierContracts)) {
            supplierContract.toSupplier = suppliersMap[supplierContract.supplierID];
        }

        return supplierContracts;
    });
});