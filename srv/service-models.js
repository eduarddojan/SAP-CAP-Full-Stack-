const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
	const suppliers = await cds.connect.to('byd_suppliers');
  
    this.on('READ', 'Suppliers', async req => {
        return suppliers.run(req.query);
    });
});