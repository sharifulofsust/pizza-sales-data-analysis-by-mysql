create database pizza;
use pizza;
select * from pizzadata;

select count(*) from pizzadata;   /* there are total 48620 records in the dataset*/

select count(distinct order_id) as total_order
from pizzadata;  /* Total 21350 order has been placed*/


select sum(quantity) as Total_pizza_sold
from pizzadata;  /* total 49574 pizza was sold*/

select round(sum(total_price),0) as Total_Revenue
from pizza; 
            /*total revenue is 817860*/


select count(distinct pizza_category)
from pizzadata;   /* there are total 4 different types of pizza category -classic, veggie, supreme, chicken*/

select   pizza_category,
round(avg(unit_price),2) as average_price
from pizzadata
group by 1
order by 2 desc; /* on average chicken is the most expensive category(17.71)and classic is the cheapest(14.8)*/



select round(sum(total_price)/count(distinct order_id),2) as average_order_value
from pizzadata; /* On average an customer order 38.31 dollars worth pizza */


select round(sum(total_price)/sum(quantity),2)  as average_price
from pizzadata; /* the average price of the pizza is 16.5*/


select round(sum(quantity)/count(distinct order_id),2) as pizza_per_order
from pizzadata;  /* 2.32 pizza per delivery on average*/



 select count(distinct pizza_ingredients) 
  from pizzadata; /*there are total 32 types of ingredients that are used to make pizza different types of pizza*/
  
  
  
  select pizza_ingredients,
  count(pizza_ingredients) as ingredientss_count
  from pizzadata
  group by 1
  order by 2 desc;  /*Chicken, Pineapple, Tomatoes, Red Peppers, Thai Sweet Chilli Sauce are the most used ingredients (2315) and 
					Brie Carre Cheese, Prosciutto, Caramelized Onions, Pears, Thyme, Garlic are the least used(480)*/


select * from pizzadata;



select pizza_name, 
count(distinct order_id) as order_count,
sum(quantity) as amount
  from pizzadata
  group by 1
  order by 3  desc; /* the classic deluxe pizza is the most ordered pizza(2329 times) where the amount is 2453 
						and the Brie Carrie  pizza is the least ordered(480 times) where the amount is 490  */
  
  
  
  SELECT  pizza_name, ROUND(SUM(total_price)) AS Total_Revenue,
   round(sum(total_price)*100/(select sum(total_price) from pizzadata),2) as PCT_of_total_Revenue
FROM pizzadata
GROUP BY pizza_name
ORDER BY Total_Revenue DESC; /* the thai chicken pizza is the most profitable(43434$) and it contributes around 5.31% of the total revenue
				 whereas THE BRIE CARRIE PIZZA IS THE LEAST PROFITABLE(11588) which contributes 1.42%*/


  


select pizza_size, sum(quantity) as sales_by_size,
count(distinct order_id) as order_count
 from pizzadata
 group by pizza_size
 order by 2 desc;   /*  the  pizza size  L is the highest sold among different pizza size(18956) and also it was ordered highest times
						and the lowest sold is XXL size pizza(28) */

select pizza_size,  round(sum(total_price),0) as Revenue_by_size
from pizzadata
group by 1
order by 2 desc;  /* the highest revenue generating pizza size is L size(375319)
						and XXL is the lowest(1007) . This can be predicted because L size pizza was the highest sold pizza*/


select pizza_size, round(sum(total_price)*100/ (select sum(total_price) from pizzadata),2) as pct_revenue_by_size
from pizzadata
group by 1
order by 2 desc; /* Here we can see L has generated about 46 percent of the total Revenue by size,
					from highest to lowst the sequence is 	L,M,S,XL,XXL */




select pizza_category, 
sum(quantity) as sales_by_category,
count(distinct order_id) as order_count
from pizzadata
group by 1
order by 2 desc; /* the most sold pizza category is classic (14888) ,it was ordered most(10859 times) and the least sold
						is Chicken pizza category(11050),it was ordered the least(8536 times) */



select pizza_category,  round(sum(total_price),0) as Revenue_by_Category
from pizzadata
group by 1
order by 2 desc; /* the highest revenue generating pizza category is Classic(220053) 
					and the lowest is  Veggie (193690) */
                    

select pizza_category, round(sum(total_price)*100/ (select sum(total_price) from pizzadata),2) as pct_revenue_by_category
from pizzadata
group by 1
order by 2 desc; /* here the classic category generates about 27 percent of the total revenue and the lowest is
						veggie(about 24 percent) . the difference is not so high in the percentage category,all the catagory
                        generates almost equal revenue*/
  
  
  select * from pizzadata;
  
  UPDATE pizzadata
SET order_date = STR_TO_DATE(order_date, '%d-%m-%Y'); /* we had to change the data type of order_date to date format as it was text format previously*/

  

alter table pizzadata
add column name_of_the_day varchar(15);

UPDATE pizzadata
SET name_of_the_day = DAYNAME(order_date);

alter table pizzadata
add column daytype varchar(15);


 alter table pizzadata
 add column MonthName varchar(15);
 update pizzadata
 set MonthName = (select monthname(order_date));
 
 
 
 ALTER TABLE pizzadata
MODIFY COLUMN order_date  AFTER MonthName  AFTER daytype   after name_of_the_day;


UPDATE pizzadata
SET daytype = (SELECT
						CASE
						WHEN name_of_the_day IN ('Sunday', 'Saturday') THEN 'weekend'
						ELSE 'weekday'
						END AS daytype);
                       


select name_of_the_day,
  count(distinct order_id) as total_order,
  sum(quantity) as total_sale,
  round(sum(total_price),0) as revenue_by_day
  from pizzadata
  group by 1
  order by 2 desc; /* most of the orders are placed in Friday(3538) and the least are in Sunday(2624), subsequently Friday is the most
					profit generating day(136074) and Sunday is the least(99203)*/


 
select * from pizzadata;

select daytype,
count(distinct order_id) as order_count,
round(sum(total_price),0) as revenue,
round(sum(total_price)*100/ (select sum(total_price) from pizzadata),2) as pct_revenue_by_daytype
from pizzadata
group by 1;
              /*about 72.81 pecent order were made in the weekdays and 27.19 percent were in weekend*/


 select * from pizzadata;
 
 
 select count(distinct monthname)
 from pizzadata; /*here we have info about 12 months*/
 
 select monthname,
 count(distinct order_id) as order_count
 from pizzadata
 group by 1
 order by 2 desc;  /*most of the order are made in July month(1935) whereas the least is in October(1646) */
 
























