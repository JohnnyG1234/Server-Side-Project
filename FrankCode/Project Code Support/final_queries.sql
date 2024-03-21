use customers;

/* Pulls customer billing address
select cfn,cln,street,city,st,zip
from customer join customeraddresstype on
	customer.cid = customeraddresstype.cid join address on
		address.add_id = customeraddresstype.add_id join addresstype on
			addresstype.add_type_id = customeraddresstype.add_type_id and
				addresstype.add_type_id=111;
*/

/* Pulls billing address and those who use a credit card  
select cfn,cln,street,city,st,zip,method_desc
from customer join customeraddresstype on
	customer.cid = customeraddresstype.cid join address on
		address.add_id = customeraddresstype.add_id join addresstype on
			addresstype.add_type_id = customeraddresstype.add_type_id and
				addresstype.add_type_id=111
	join payments.customerpaymentmethod as pm on
		pm.cid = customer.cid
    join payments.paymentmethod on
		pm.method_id = payments.paymentmethod.method_id
			and payments.paymentmethod.method_desc='Credit Card'
*/

/*Extracts customers with the orders on file 
select cfn,cln,od.order_id,od.order_date,count(*)
from customer join orders.orderdata as od on
	customer.cid = od.cid
group by customer.cid
having count(*)>1
order by cln
*/

/* Selects customers, their orders and quantities
select cfn,cln,od.order_id,od.order_date,li.qty
from customer join orders.orderdata as od on
	customer.cid = od.cid join orders.lineitem as li on
		li.order_id = od.order_id
group by customer.cid
*/
select cfn,cln,od.order_id,od.order_date,products.product.prod_name,
	li.qty, products.product.price,(li.qty*products.product.price) as 'Cost'
from customer join orders.orderdata as od on
	customer.cid = od.cid join orders.lineitem as li on
		li.order_id = od.order_id join products.product on
			li.pid = products.product.pid
group by customer.cid





