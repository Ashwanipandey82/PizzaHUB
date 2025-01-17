#Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT 
    ROUND(AVG(avg_order_per_day), 0) AS avg_orders
FROM
    (SELECT 
        orders.order_date,
            SUM(order_details.quantity) AS avg_order_per_day
    FROM
        orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY orders.order_date) AS order_average

