#Determine the top 3 most ordered pizza types based on revenue for each pizza category.
select name,Revenue from

(select
name,category,
Revenue,
RANK()over (partition by category order by Revenue desc) as rp
from 

(select 
pt.name,
pt.category,
sum(o.quantity*p.price) as Revenue
from pizza_types as pt
join pizzas as p
on pt.pizza_type_id=p.pizza_type_id
join order_details as o
on o.pizza_id=p.pizza_id
group by pt.name,pt.category) as a) as b
where rp<=3;




