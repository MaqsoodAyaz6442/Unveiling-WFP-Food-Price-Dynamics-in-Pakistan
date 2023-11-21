select *
from wfp_food_prices_pakistan;
SET SQL_SAFE_UPDATES=0;
UPDATE wfp_food_prices_pakistan
SET date=str_to_date(date,'%m/%d/%Y');
alter table wfp_food_prices_pakistan
modify date DATETIME;
select date, cmname,price, mktname
from wfp_food_prices_pakistan
where mktname in ('Quetta','Karachi','Peshawar') and price<=50;
select count(mktname)
from wfp_food_prices_pakistan;
select count(distinct mktname)
from wfp_food_prices_pakistan;
select distinct mktname
from wfp_food_prices_pakistan;
select distinct cmname
from commodity;
select mktname as City,avg(price) as avg_price
from wfp_food_prices_pakistan
where cmname in ('Wheat flour - Retail')
Group by City;
select mktname as City, avg(price) as avg_price, max(price) as max_price,cmname as Commodity
from wfp_food_prices_pakistan
where mktname != 'Karachi' and cmname LIKE 'Wheat%'
group by mktname, cmname
order by City, Commodity;
SELECT mktname as City, AVG(price) as Avr_price
from wfp_food_prices_pakistan
where trim(cmname) LIKE '%Wheat - Retail%'
group by mktname
Having AVG(price)<30;
create table Categorized_Prices as
select
    mktname as City,
    cmname as Commodity,
    price,
    case
        when price < 30 then 'LOW'
        when price > 250 then 'HIGH'
        else 'FAIR'
    end as  Price_Category
from
    wfp_food_prices_pakistan;
select *
from categorized_prices;
select * 
from wfp_food_prices_pakistan;
alter table wfp_food_prices_pakistan
Add column city_category varchar(50);

update wfp_food_prices_pakistan
set city_category=
case
when mktname in ('Karachi','Lahore') then 'Big City'
when mktname in ('Peshawar','Multan') then 'Medium City'
else 'Small City'
End; 
select date,cmname,category,mktname,price,city_category
from wfp_food_prices_pakistan;
alter table wfp_food_prices_pakistan
add column price_fairness varchar(16);
update wfp_food_prices_pakistan
set price_fairness=
case
when price<'100' then 'Fair'
when price>='100' then 'Unfair'
when price>'300' then 'Speculative'
else 'Other'
end;
select *
from wfp_food_prices_pakistan;
select *
from wfp_food_prices_pakistan
left join commodity on wfp_food_prices_pakistan.cmname =commodity.cmname;
select *
from wfp_food_prices_pakistan
inner join commodity on wfp_food_prices_pakistan.cmname=commodity.cmname;





