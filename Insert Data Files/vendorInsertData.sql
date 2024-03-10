use vendor;

DELETE FROM VendorCompany;
DELETE FROM VendorSalesPerson;
DELETE FROM vendorcontact;
DELETE FROM vendorpersoncontact;

-- inserting into vendor company
INSERT INTO VendorCompany VALUES(101,'Speedster');
INSERT INTO VendorCompany VALUES(202,'Acme');
INSERT INTO VendorCompany VALUES(303,'Widget');
SET foreign_key_checks = 0;	-- could not insert without disabling fk checks

INSERT INTO VendorSalesPerson VALUES(001, 'Elliot','Jones', 101);
INSERT INTO VendorSalesPerson VALUES(002, 'Mary','Course', 101);
INSERT INTO VendorSalesPerson VALUES(003, 'Sarah','Hopkins', 101);
INSERT INTO VendorSalesPerson VALUES(004, 'Sally','Saw', 202);
INSERT INTO VendorSalesPerson VALUES(005, 'Steve','Perez', 202);
INSERT INTO VendorSalesPerson VALUES(006, 'Jane','Smith', 202);
INSERT INTO VendorSalesPerson VALUES(007, 'John','Cuts', 303);

INSERT INTO vendorcontact VALUES(001,'888-865-6547');
INSERT INTO vendorcontact VALUES(002,'888-865-1235');
INSERT INTO vendorcontact VALUES(003,'888-865-4569');
INSERT INTO vendorcontact VALUES(004,'800-654-9874');
INSERT INTO vendorcontact VALUES(005,'ejones@speedster.com');
INSERT INTO vendorcontact VALUES(006,'mcourse@speedster.com');
INSERT INTO vendorcontact VALUES(007,'shopkins@speedster.com');
INSERT INTO vendorcontact VALUES(008,'ss@acme.com');
INSERT INTO vendorcontact VALUES(009,'sp@acme.com');
INSERT INTO vendorcontact VALUES(010,'js@acme.com');
INSERT INTO vendorcontact VALUES(011,'jc@gmail.com');

-- vendor person contact email
INSERT INTO vendorpersoncontact VALUES(001,005,'email');
INSERT INTO vendorpersoncontact VALUES(002,006,'email');
INSERT INTO vendorpersoncontact VALUES(003,007,'email');
INSERT INTO vendorpersoncontact VALUES(004,008,'email');
INSERT INTO vendorpersoncontact VALUES(005,009,'email');
INSERT INTO vendorpersoncontact VALUES(006,010,'email');
INSERT INTO vendorpersoncontact VALUES(007,011,'email');
-- vendor person contact phone
INSERT INTO vendorpersoncontact VALUES(004,001,'phone');
INSERT INTO vendorpersoncontact VALUES(005,012,'phone');
INSERT INTO vendorpersoncontact VALUES(006,003,'phone');
INSERT INTO vendorpersoncontact VALUES(007,004,'phone');

SET foreign_key_checks = 1;