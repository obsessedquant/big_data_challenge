-- Get total count of review_id
SELECT COUNT(review_id) FROM software
-- value is 341,931

-- Calculate Median of helpful_votes
SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY helpful_votes) FROM software;
-- median came out to 1, not useful to filter by median in this case

-- Calculate Average of helpful_votes
SELECT AVG(helpful_votes) AS avg_helpful_votes FROM software;
-- average came out to 4.36, use 5 as average for filtering

-- Filter helpful votes by greater than 3 and sort as descending of helpful_votes value
SELECT * FROM software
WHERE helpful_votes > 5
ORDER BY helpful_votes DESC
-- count 58,333

-- Filter from above + additional filter of verified purchase = Y and vine = N
SELECT * FROM software
WHERE helpful_votes > 5 AND verified_purchase = 'Y' AND vine = 'N'
ORDER BY helpful_votes DESC
-- count 14,435

-- Get average of rating for verified purchase non-vine products that have greater than 5 helpful votes
SELECT AVG(star_rating) AS star_rating_verified_purchase FROM software
WHERE helpful_votes > 5 AND verified_purchase = 'Y' AND vine = 'N'
-- avg rating for verified purchases is 3.07

-- Filter by vine = 'Y' and helpful_votes > 5
SELECT * FROM software
WHERE helpful_votes > 5 AND vine = 'Y'
ORDER BY helpful_votes DESC
-- count 835

-- Get average of rating for vine products that have greater than 5 helpful votes
SELECT AVG(star_rating) AS star_rating_vine_program FROM software
WHERE helpful_votes > 5 AND vine = 'Y'
-- avg rating for verified purchases is 3.67