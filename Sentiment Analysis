--BRAND SENTIMENT ANALYSIS BASED ON REVIEWS

--STEP ONE: Temporary table with a case statement to assign sentiment categories based on keywords
WITH sentiment AS (
	SELECT
		product_id,
		review_text,
		CASE
			WHEN LOWER(review_text) LIKE '%love%' OR LOWER(review_text) LIKE '%amazing%' OR LOWER(review_text) LIKE '%great%' OR LOWER(review_text) LIKE '%favorite%' THEN 'Positive'
			WHEN LOWER(review_text) LIKE '%hate%' OR LOWER(review_text) LIKE '%disappoint%' OR LOWER(review_text) LIKE '%overhyped%' OR LOWER(review_text) LIKE '%not worth%' THEN 'Negative'
			ELSE 'Neutral'
		END AS Sentiment
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
--Brands with the greatest # of positive reviews: 1. LANEIGE, 2. fresh, 3. Tatcha
