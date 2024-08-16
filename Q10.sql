#Determine the top 3 most ordered pizza types based on revenue.
SELECT 
    pt.name,
    ROUND((AVG(p.price) * SUM(o.quantity)), 2) AS Revenue
FROM
    pizza_types AS pt
        JOIN
    pizzas AS p ON pt.pizza_type_id = p.pizza_type_id
        JOIN
    order_details AS o ON o.pizza_id = p.pizza_id
GROUP BY pt.name
order by Revenue desc
LIMIT 3