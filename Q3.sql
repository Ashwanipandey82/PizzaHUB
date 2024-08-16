# identity the highest price pizza
SELECT 
    p.name, pizzas.price
FROM
    pizzas
        JOIN
    pizza_types AS p ON pizzas.pizza_type_id = p.pizza_type_id
ORDER BY price DESC
LIMIT 1






