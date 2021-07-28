{\rtf1\ansi\ansicpg1252\cocoartf2513
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 \'97The update to POSTGRESQL is in .ipynb also the answer of the question 4.\
\
\'97I got done these documents, the Tableau I still working on.  I can Send my progress\'85\
\
\
1. Calculate the number of orders per day of the week, distinguishing if the orders are on_demand.\
select (case when on_demand='false' then count(distinct order_id)\
else count(distinct order_id)end) demand,dow day_of_week,on_demand from orders group by dow,on_demand\
\
select(case when on_demand='false'then'false' else 'true' end) as demand\
2. Calculate the average quantity of distinct products that each order has,\
grouped by store\
\
SELECT distinct A.product_id ,round(AVG(cast(A.quantity as numeric)),2),A.buy_unit,C.store\
from order_product A\
inner join orders B\
on A.order_id = B.order_id\
inner join storebranch C\
on B.store_branch_id = C.store_branch_id\
group by A.product_id,A.buy_unit,C.store\
order by c.store\
\
3. Calculate the average found rate(*) of the orders grouped by \
the product format and day of the week.\
\
--Com o count podemos ver que os n\'fameros multiplicaram em rela\'e7\'e3o \'e0 quantidade de pedidos\
with d as (SELECT count(*) as quantity_of_orders,\
	round(cast(sum(quantity)as numeric)\
	  /\
	COALESCE(NULLIF(cast(quantity_found as numeric),0), 1),2) \
	as ratio FROM order_product\
INNER JOIN orders\
ON order_product.order_id = orders.order_id\
GROUP BY order_product.order_id,\
order_product.quantity_found,\
order_product.buy_unit,orders.dow)\
select trunc(d.ratio/d.quantity_of_orders,2) as ratioAll from d\
\
4. Calculate the average error and mean squared error of our estimation model\
--SELECT actual_time +(total_minutes::numeric||' minute')::INTERVAL as my_date FROM orders\
\
\
for each hour of the day.\
SELECT ID_PARTNER, ID_ACCOUNT\
  , SQRT(Avg( POWER(actual_time - promised_time , 2) ) ) as feature_1_rmse\
FROM orders\
GROUP BY dow\
\
5. Calculate the number of orders in which the picker_id and driver_id are different.\
\
SELECT 		\
		COUNT(DISTINCT order_id)\
  FROM orders\
 WHERE picker_id <> driver_id\
}