
--analyzing top brands based on total sum of loves_count (user 'favorite' feature on website)
--also displaying average product rating (rounded) + total # of reviews for each brand
select
	brand_name as 'Brand',
	sum(loves_count) as 'Total Loves',
	round(avg(rating),2) as 'Average Product Rating',
	sum(reviews) as 'Total Reviews'
from product_info
group by brand_name
order by 2 desc;
--1. Sephora Collection, 2. Fenty Beauty by Rihanna, 3. Anastasia Beverly Hills, 4. Charlotte Tilbury, 5. The Ordinary

--identifying products with highest and lowest ratings (over 50 reviews)
select
	product_name,
	brand_name,
	round(rating,2) as 'rating',
	reviews
from product_info
where rating = (
	select max(rating) from product_info
	where reviews > 50
	)
--highest rating: BondiBoost Rapid Repair Hair Mask

select
	product_name,
	brand_name,
	round(rating,2) as 'rating',
	reviews
from product_info
where rating = (
	select min(rating) from product_info
	where reviews > 50
	)
--lowest rating: Sephora LashCraft Mascara

--calculating the average, maximum, and minimum prices for each product category
select
	tertiary_category as 'Product Type',
	avg(price_usd) as 'Average Price',
	min(price_usd) as 'Minimum Price',
	max(price_usd) as 'Maximum Price'
from product_info
where tertiary_category is not null
group by tertiary_category
order by 1;
