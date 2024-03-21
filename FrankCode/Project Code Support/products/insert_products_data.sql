use products;

delete from Productinventory where pid>0;
delete from ProductPriceHistory where pid>0;
delete from PartProduct;
delete from Product where pid>0;

insert into Product values(896,'The Road Warrior','This is our finest all-purpose bike. Great for all activites',450);
insert into Product values(125,'Racing Bike','Our premier racing bike',1900);
insert into Product values(023,'Premier Mountain Bike','This bike will have you scaling new heights',780);
insert into Product values(705,'Cruising Bike','For those who enjoy a causal bike ride or racing events.',2500);


insert into ProductInventory values(896,10,'2019-03-1',15);
insert into ProductInventory values(125,18,'2019-03-1',25);
insert into ProductInventory values(023,25,'2019-03-1',45);
insert into ProductInventory values(705,10,'2019-03-1',20);

insert into ProductPriceHistory values(705,'2018-03-1',2000);
insert into ProductPriceHistory values(705,'2018-01-1',1900);
insert into ProductPriceHistory values(705,'2017-06-11',1700);
insert into ProductPriceHistory values(896,'2018-09-10',400);
insert into ProductPriceHistory values(896,'2018-02-18',390);
insert into ProductPriceHistory values(896,'2017-11-30',350);
insert into ProductPriceHistory values(125,'2019-12-10',1890);
insert into ProductPriceHistory values(125,'2019-02-06',1800);
insert into ProductPriceHistory values(125,'2018-10-12',1700);
insert into ProductPriceHistory values(125,'2017-08-16',1600);
insert into ProductPriceHistory values(023,'2019-02-16',700);
insert into ProductPriceHistory values(023,'2018-07-01',675);
insert into ProductPriceHistory values(023,'2017-12-16',625);

INSERT INTO PartProduct VALUES('BF2001',705);
INSERT INTO PartProduct VALUES('F0235',23);
INSERT INTO PartProduct VALUES('F9870',705);
INSERT INTO PartProduct VALUES('BF452',125);
INSERT INTO PartProduct VALUES('F6431',125);
INSERT INTO PartProduct VALUES('BF1478',896);
INSERT INTO PartProduct VALUES('F9632',896);
INSERT INTO PartProduct VALUES('S258',705);
INSERT INTO PartProduct VALUES('BT852',705);
INSERT INTO PartProduct VALUES('BT987',23);
INSERT INTO PartProduct VALUES('BT9635',125);
INSERT INTO PartProduct VALUES('BT4697',896);
INSERT INTO PartProduct VALUES('C3402',23);
INSERT INTO PartProduct VALUES('CS3214',896);
INSERT INTO PartProduct VALUES('K98',125);
INSERT INTO PartProduct VALUES('S0023',705);
INSERT INTO PartProduct VALUES('J8790',23);
INSERT INTO PartProduct VALUES('S2301',896);
INSERT INTO PartProduct VALUES('S124',705);
INSERT INTO PartProduct VALUES('S1029',125);
INSERT INTO PartProduct VALUES('S3297',705);
INSERT INTO PartProduct VALUES('S4501',896);
INSERT INTO PartProduct VALUES('S267',23);
INSERT INTO PartProduct VALUES('S678',125);
INSERT INTO PartProduct VALUES('BP0504',896);
INSERT INTO PartProduct VALUES('BP9802',23);
INSERT INTO PartProduct VALUES('BP301',705);
INSERT INTO PartProduct VALUES('BP942',125);
INSERT INTO PartProduct VALUES('RTW025',23);
INSERT INTO PartProduct VALUES('RTW985',125);
INSERT INTO PartProduct VALUES('RTW7135',705);
INSERT INTO PartProduct VALUES('RT7391',896);
INSERT INTO PartProduct VALUES('BDR001',23);
INSERT INTO PartProduct VALUES('BDR510',705);
INSERT INTO PartProduct VALUES('BDT311',125);
INSERT INTO PartProduct VALUES('BDT888',896);
INSERT INTO PartProduct VALUES('FF45',705);
INSERT INTO PartProduct VALUES('FF99',896);
INSERT INTO PartProduct VALUES('BBS087',23);
INSERT INTO PartProduct VALUES('BBS986',705);
INSERT INTO PartProduct VALUES('BBS055',125);
INSERT INTO PartProduct VALUES('BBS777',896);
INSERT INTO PartProduct VALUES('BR7896',896);
INSERT INTO PartProduct VALUES('BR4563',125);
INSERT INTO PartProduct VALUES('BR0021',705);
INSERT INTO PartProduct VALUES('BR9164',23);

select * from ProductInventory;
select * from ProductPriceHistory;
select * from PartProduct;
select * from Product
