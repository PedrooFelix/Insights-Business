# Business Intelligence

The business operates in more than 20 cities, reaching tens of thousands of orders per day. One key element to determine how many orders we can accept, when we must begin to work on an order and also, at which time can we promise delivery to the customer, is the **time estimation**.

***Orders table***:

- order_id: identifier of the order.
- lat and lng: Latitude and Longitude of the delivery address.
- dow: day of the week of the promised delivery date of the order. 0: Sunday 6: Saturday.
- promised_time: Hour of the delivery time *promised* to the customer.
- actual_time: Hour in which the order was *delivered* to the customer.
- on_demand: If the order was requested in "Less than 90 minutes" or in a future time window.
- picker_id:  identifier of the shopper that made the picking of the order. 
- driver_id: identifier of the shopper that made the delivery of the order.
- store_branch_id: identifier of the store branch in which the order was purchased.
- total_minutes: total time length of the order (from purchase to delivery)

***Order_Product table***:

- order_id: identifier of the order.
- product_id: identifier of the product.
- quantity: quantity of the product requested by the customer.
- quantity_found: quantity found of the product by the shopper.
- buy_unit: format in which the product was sold (unit or KG).

***Shoppers table***:

- shopper_id: identifier of the Shopper.
- seniority: level of shopper's experience.
- found_rate: historic percentage of the products that the shopper found.
- picking_speed: historic velocity of the shopper's picking of products. ==(minutes per product)==
- accepted_rate: historic percentage of orders accepted by the shopper.
- rating: historic customer's evaluation/rating to the shopper.

***Storebranch table***:

- store_branch_id: identifier of the store branch.
- store: identifier of the store in which the branch belongs to.
- lat y lng: Latitude and Longitude of the branch location.


The goal is to answer the following questions regarding our operation. You must use SQL queries and plot the output of each SQL query using Tableau. 

**Questions**:

1. Calculate the number of orders per day of the week, distinguishing if the orders are on_demand.
2. Calculate the average quantity of distinct products that each order has, grouped by store
3. Calculate the average found rate(*) of the orders grouped by the product format and day of the week.
4. Calculate the average error and mean squared error of our estimation model for each hour of the day.
5. Calculate the number of orders in which the picker_id and driver_id are different.

(*) Found Rate = ratio between the quantity product found vs the number of products ordered by the customer.
