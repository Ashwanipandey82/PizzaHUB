#calculate total revenue from pizza sales 
SELECT 
    ROUND(SUM(o.quantity) * (AVG(p.price)), 2) AS total_revenue
FROM
    pizzas AS p
        CROSS JOIN
    order_details AS o ON p.pizza_id = o.pizza_id