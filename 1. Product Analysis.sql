--PRODUCT ANALYSIS:

--Analyzing top brands based on total sum of loves_count (user 'favorite' feature on website)
--Also displaying average product rating (rounded) + total # of reviews for each brand
SELECT
	brand_name as 'Brand',
	sum(loves_count) as 'Total Loves',
	round(avg(rating),2) as 'Average Product Rating',
	sum(reviews) as 'Total Reviews'
FROM product_info
GROUP BY brand_name
ORDER BY 2 DESC;
--1. Sephora Collection, 2. Fenty Beauty by Rihanna, 3. Anastasia Beverly Hills, 4. Charlotte Tilbury, 5. The Ordinary

--Identifying products with highest and lowest ratings (over 50 reviews)
SELECT
	product_name,
	brand_name,
	round(rating,2) as 'rating',
	reviews
FROM product_info
WHERE rating = (
	SELECT max(rating)
	FROM product_info
	WHERE reviews > 50
	)
--Highest rating: BondiBoost Rapid Repair Hair Mask

SELECT
	product_name,
	brand_name,
	round(rating,2) as 'rating',
	reviews
FROM product_info
WHERE rating = (
	SELECT min(rating) FROM product_info
	WHERE reviews > 50
	)
--Lowest rating: Sephora LashCraft Mascara

--Calculating the average, maximum, and minimum prices for each product category
SELECT
	tertiary_category as 'Product Type',
	avg(price_usd) as 'Average Price',
	min(price_usd) as 'Minimum Price',
	max(price_usd) as 'Maximum Price'
FROM product_info
WHERE tertiary_category IS NOT NULL
GROUP BY tertiary_category
ORDER BY 1;
