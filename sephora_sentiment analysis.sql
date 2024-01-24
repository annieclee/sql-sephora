--BRAND SENTIMENT ANALYSIS BASED ON REVIEWS

--STEP ONE: Temporary table with a case statement to assign sentiment categories based on keywords

WITH sentiment AS (
	select
		product_id,
		review_text,
		case
			when LOWER(review_text) like '%love%' or LOWER(review_text) like '%amazing%' or LOWER(review_text) like '%great%' or LOWER(review_text) like '%favorite%' then 'Positive'
			when LOWER(review_text) like '%hate%' or LOWER(review_text) like '%disappoint%' or LOWER(review_text) like '%overhyped%' or LOWER(review_text) like '%not worth%' then 'Negative'
			else 'Neutral'
		end as Sentiment
	FROM [reviews_0-250]
	)

--STEP TWO: Aggregating the sentiment data to analyze which brands have the most positive & negative reviews
--Includes multiple table joins to combine rows from 'product_info', 'reviews_0-250', and 'sentiment' (temp table)

SELECT
    p.brand_name,
    COUNT(*) AS total_reviews,
    COUNT(CASE WHEN s.sentiment = 'Positive' THEN 1 END) AS positive_reviews,
    COUNT(CASE WHEN s.sentiment = 'Negative' THEN 1 END) AS negative_reviews
FROM
    product_info p
JOIN
    [reviews_0-250] r ON p.product_id = r.product_id
JOIN
	sentiment s ON s.product_id = p.product_id
GROUP BY
    p.brand_name
ORDER BY positive_reviews DESC;