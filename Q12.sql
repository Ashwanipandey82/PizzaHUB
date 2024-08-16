select 
cummulative.order_date,
sum(cummulative.Revenue) over (order by order_date) as CUM_REVENUE

from
(select 
ord.order_date,
sum(o.quantity*p.price) as Revenue
from  order_details as o
join pizzas as p
on o.pizza_id=p.pizza_id
join
     orders as ord
     on ord.order_id=o.order_id
    
group by ord.order_date
) as cummulative
group by cummulative.order_date
     