#dentify the most common pizza size ordered.
SELECT 
    p.size, COUNT(o.order_details_id) as order_Count
FROM
    order_details AS o
        JOIN
    pizzas AS p ON o.pizza_id = p.pizza_id
GROUP BY p.size
LIMIT 1;
