select * from vendorcompany;
select * from vendorcontact;
select * from vendorsalesperson;
select * from vendorpersoncontact;

select vendorcompany.vendor_name, vendorsalesperson.vfn, vendorsalesperson.vln from vendorcompany join vendorsalesperson on vendorcompany.vid = vendorsalesperson.vid;