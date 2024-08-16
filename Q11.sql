

SELECT 
   Distribution.category,
    ROUND(Distribution.Revenue/Final_category.Total_Revenue*100,2)AS Percentage_of_Category
FROM (SELECT 
        pt.category, SUM(o.quantity * p.price) AS Revenue
    FROM
        pizza_types AS pt
    JOIN pizzas AS p ON pt.pizza_type_id = p.pizza_type_id
    JOIN order_details AS o ON o.pizza_id = p.pizza_id
    GROUP BY pt.category
    order by 2 desc)
    as Distribution,
    
    (select 
    sum(o.quantity*p.price) as Total_Revenue 
    from pizza_types as pt
    join pizzas as p
    on pt.pizza_type_id=p.pizza_type_id
       JOIN order_details AS o ON o.pizza_id = p.pizza_id
       ) 
    as Final_category


