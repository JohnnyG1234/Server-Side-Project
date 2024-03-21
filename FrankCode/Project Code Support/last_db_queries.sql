use customers;

/*Customers and payment methods
select cfn,cln,method_desc
from customer join payments.customerpaymentmethod as cmp on 
	customer.cid = cmp.cid join payments.paymentmethod as pm on
		cmp.method_id = pm.method_id
*/

/* Customers and their orders 
select cfn,cln,order_id, order_date,count(*)
from customer join orders.orderdata on
	customer.cid = orders.orderdata.cid
group by customer.cid
having count(*)>1
order by cln
*/

/*Customer and orders
select cfn,cln,orderdata.order_id, order_date,qty
from customer join orders.orderdata on
	customer.cid = orders.orderdata.cid join orders.lineitem on
		orders.orderdata.order_id = orders.lineitem.order_id
*/

/*Customers, orders and costs 
select cfn,cln,orderdata.order_id,order_date,prod_name,price,qty,
	(price*qty) as 'Cost'
from customer join orders.orderdata on
	customer.cid = orders.orderdata.cid join orders.lineitem on
		orders.orderdata.order_id = orders.lineitem.order_id join
			products.product on orders.lineitem.pid = products.product.pid
order by cln
*/

select cfn,cln,orderdata.order_id,order_date,prod_name,price,qty,
	(price*qty) as 'Cost',method_desc
from customer join orders.orderdata on
	customer.cid = orders.orderdata.cid join orders.lineitem on
		orders.orderdata.order_id = orders.lineitem.order_id join
			products.product on orders.lineitem.pid = products.product.pid join
				payments.customerpaymentmethod on 
					customer.cid = payments.customerpaymentmethod.cid join
						payments.paymentmethod on
							payments.paymentmethod.method_id = 
								payments.customerpaymentmethod.method_id 
order by cln


