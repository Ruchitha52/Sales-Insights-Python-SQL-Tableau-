select * from retail_orders.df_orders;

-- find top 10 highest revenue generating products--
select product_id,category,sub_category,sum(list_price * quantity) as total_sales from df_orders
group by product_id ,category,sub_category
order by total_sales desc
limit 10 ;
 
 -- find top 5 highest selling product in each region -- 
with rankedsales as (
 select product_id, region, sum(sales_price) as total_sales,
		row_number()over(partition by region order by sum(sales_price) desc) as `rank`
 from df_orders
 group by product_id, region
 )
 select product_id,region,total_sales
 from rankedsales
 where `rank`<=5
 order by region,total_sales desc;
 
 -- for each category which month had highest sales -- 
 with highestsales as (
   select category , MONTH(order_date) as month,sum(list_price*quantity) as total_sales from df_orders
   group by category , month
   order by total_sales desc
   )
  select * from
  ( select *,
row_number() over (partition by category order by total_sales desc ) as rn
from highestsales ) as a
where rn=1;

-- to Compare Monthly Sales for Two Different Years--
with cte as (
select MONTH(order_date) as month , 
YEAR(order_date) as year,
sum(list_price * quantity) as total_sales 
from df_orders
group by month ,year
)
select month,
sum(case when year = 2022 then total_sales else 0 end) as sales_2022 ,
sum(case when year = 2023 then total_sales else 0 end) as sales_2023
from cte 
group by month 
order by month;

-- to Find Subcategory with Highest Growth by Profit in 2023 compare to 2022   
with cte as (
select sub_category , sum(profit) as total_profit ,year(order_date) as year 
from df_orders
group by sub_category,year
),
cte2 as (
select sub_category ,
sum(ROUND(case when year = 2022 then total_profit else 0 end,2)) as profit_2022 ,
sum(ROUND(case when year = 2023 then total_profit else 0 end,2)) as profit_2023
from cte 
group by sub_category 
)
select * ,
 ROUND(case 
    when profit_2022 = 0 then 100
    else ((profit_2023-profit_2022))/100
    end ,2 ) as profit_growth
from cte2
order by profit_growth desc
limit 5;

-- Monthly Profit Trends --
with cte as (
 select category , sum(profit) as total_profit ,
 MONTH(order_date) as month , YEAR(order_date) as year
 from df_orders
 group by category ,year,month
 )
select category, year, month, 
    ROUND(total_profit,2)
FROM cte
ORDER BY year, month, category;
 
 

 
 
