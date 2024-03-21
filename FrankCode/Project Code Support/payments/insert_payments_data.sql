use payments;

delete from GiftCard where cid > 0;
delete from GiftCardAmt where gift_card_number !='';
delete from CreditDebit where cid > 0;
delete from CustCard where card_number != '';
delete from Checking where cid > 0;
delete from Bank where routing_id > 0;
delete from CustomerPaymentMethod where cid >0 ;
delete from PaymentMethod where method_id > 0;

insert into PaymentMethod values(111, 'Credit Card');
insert into PaymentMethod values(222, 'Debit Card');
insert into PaymentMethod values(333, 'Checking Account');
insert into PaymentMethod values(444, 'Gift Card');

insert into CustomerPaymentMethod values(104, 111);
insert into CustomerPaymentMethod values(104, 222);
insert into CustomerPaymentMethod values(104, 333);
insert into CustomerPaymentMethod values(105, 111);
insert into CustomerPaymentMethod values(105, 222);
insert into CustomerPaymentMethod values(105, 333);
insert into CustomerPaymentMethod values(106, 111);
insert into CustomerPaymentMethod values(106, 444);
insert into CustomerPaymentMethod values(106, 333);
insert into CustomerPaymentMethod values(106, 222);
insert into CustomerPaymentMethod values(107, 333);
insert into CustomerPaymentMethod values(107, 111);
insert into CustomerPaymentMethod values(108, 111);
insert into CustomerPaymentMethod values(108, 222);
insert into CustomerPaymentMethod values(108, 333);
insert into CustomerPaymentMethod values(109, 222);
insert into CustomerPaymentMethod values(109, 333);
insert into CustomerPaymentMethod values(109, 444);
insert into CustomerPaymentMethod values(11, 222);
insert into CustomerPaymentMethod values(12, 333);
insert into CustomerPaymentMethod values(13, 222);
insert into CustomerPaymentMethod values(14, 333);
insert into CustomerPaymentMethod values(15, 444);
insert into CustomerPaymentMethod values(16, 333);
insert into CustomerPaymentMethod values(17, 111);
insert into CustomerPaymentMethod values(18, 111);
insert into CustomerPaymentMethod values(19, 222);
insert into CustomerPaymentMethod values(20, 333);
insert into CustomerPaymentMethod values(21, 111);
insert into CustomerPaymentMethod values(22, 222);
insert into CustomerPaymentMethod values(23, 333);

insert into Bank values(200100300, 'First National Bank of There');
insert into Bank values(896231456, 'People`s United Bank');
insert into Bank values(112200036, 'First National Bank of Manchester');
insert into Bank values(200100301, 'First National Bank of Keene');
insert into Bank values(100100123, 'First Bank of Maine');
insert into Bank values(898989896, 'Rutland Federal Credit Union');

insert into Checking values(12, 333, 123456789023, 200100301);
insert into Checking values(14, 333, 650023587895, 896231456);
insert into Checking values(16, 333, 980065412654, 112200036);
insert into Checking values(104, 333, 123456780235, 200100301);
insert into Checking values(105, 333, 555898990999, 100100123);
insert into Checking values(106, 333, 225225333001, 898989896);
insert into Checking values(107, 333, 225225333147, 112200036);
insert into Checking values(108, 333, 225225333852, 112200036);
insert into Checking values(109, 333, 225225333741, 898989896);

insert into CustCard values('5555555555555555', 'Mastercard', '208', '05401', '05', '2018');
insert into CustCard values('4444444444444444', 'American Express', '481', '05401', '07', '2017');
insert into CustCard values('2222222222222222', 'Visa', '493', '05601', '02', '2018');
insert into CustCard values('1112223334445555', 'Discover', '852', '04568', '12', '2017');
insert into CustCard values('5556669998887777', 'American Express', '963',  '04568', '10', '2018');
insert into CustCard values('1236547899876540', 'American Express', '481', '04896', '07', '2017');
insert into CustCard values('5555444444444445', 'Mastercard', '208', '04896', '05', '2018');
insert into CustCard values('2589631478963250', 'Visa', '493', '01568', '02', '2019');
insert into CustCard values('2588956986532120', 'Visa', '852', '05444', '12', '2017');
insert into CustCard values('7778965478321450', 'American Express', '963', '05444', '10', '2016');

insert into CreditDebit values(21, 111, '5555555555555555');
insert into CreditDebit values(17, 111, '4444444444444444');
insert into CreditDebit values(19, 222, '2222222222222222');
insert into CreditDebit values(18, 111, '1112223334445555');
insert into CreditDebit values(13, 222, '5556669998887777');
insert into CreditDebit values(104, 111, '1236547899876540');
insert into CreditDebit values(104, 222, '5555444444444445');
insert into CreditDebit values(105, 222, '2589631478963250');
insert into CreditDebit values(106, 222, '2588956986532120');
insert into CreditDebit values(106, 111, '7778965478321450');

/*inserts for gift card amount */
insert into GiftCardamt values(4445689632156987,5000);
insert into GiftCardamt values(4445681123654777,2500);
insert into GiftCardamt values(4445682255589660,1000);

/*inserts for gift card*/
insert into GiftCard values(15,444,4445689632156987);
insert into GiftCard values(106,444,4445681123654777);
insert into GiftCard values(109,444,4445682255589660);

/*inserts for gift card history */
insert into GiftCardHistory values(4445682255589660,'2023-12-29 09:38:58',1000); /*Customer 102: John Doe */
insert into GiftCardHistory values(4445681123654777,'2024-01-05 10:15:10',1000); /*Customer 106: Jane Same */
insert into GiftCardHistory values(4445681123654777,'2024-01-14 15:01:23',1000); /*Customer 106: Jane Same */
insert into GiftCardHistory values(4445689632156987,'2024-01-21-19:07:46',1000); /*Customer 109: William Wonderful */
insert into GiftCardHistory values(4445689632156987,'2024-01-25 08:27:01',500);  /*Customer 109: William Wonderful */
insert into GiftCardHistory values(4445689632156987,'2024-02-15 13:49:28',500);  /*Customer 109: William Wonderful */

select * from PaymentMethod;
select * from CustomerPaymentMethod;
select * from Bank;
select * from Checking;
select * from CustCard;
select * from GiftCard;
select * from GiftCardAmt;
select * from GiftCardHistory;
select * from CreditDebit;

