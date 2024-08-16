#Join the necessary tables to find the total quantity of each pizza category ordered.
select 
pt.category,
sum(o.quantity) as Quantity
from pizza_typeS as pt
join pizzas as p
on pt.pizza_type_id=p.pizza_type_id
join order_details as o
on o.pizza_id=p.pizza_id
group by pt.category
order by Quantity desc
