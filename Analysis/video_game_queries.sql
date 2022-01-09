-- Get total count of review_id
SELECT COUNT(review_id) FROM video_games
-- value is 1,785,997

-- Calculate Median of helpful_votes
SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY helpful_votes) FROM video_games;
-- median came out to 0, not useful to filter by median in this case

-- Calculate Average of helpful_votes
SELECT AVG(helpful_votes) AS avg_helpful_votes FROM video_games;
-- average came out to 2.25, use 3 as average for filtering

-- Filter helpful votes by greater than 3 and sort as descending of helpful_votes value
SELECT * FROM video_games
WHERE helpful_votes > 3
ORDER BY helpful_votes DESC
-- count 227,489

-- Filter from above + additional filter of verified purchase = Y and vine = N
SELECT * FROM video_games
WHERE helpful_votes > 3 AND verified_purchase = 'Y' AND vine = 'N'
ORDER BY helpful_votes DESC
-- count 62,914

-- Get average of rating for verified purchase non-vine products that have greater than 5 helpful votes
SELECT AVG(star_rating) AS star_rating_verified_purchase FROM video_games
WHERE helpful_votes > 3 AND verified_purchase = 'Y' AND vine = 'N'
-- avg rating for verified purchases is 3.39

-- Filter by vine = 'Y' and helpful_votes > 5
SELECT * FROM video_games
WHERE helpful_votes > 3 AND vine = 'Y'
ORDER BY helpful_votes DESC
-- count 500

-- Get average of rating for vine products that have greater than 5 helpful votes
SELECT AVG(star_rating) AS star_rating_vine_program FROM video_games
WHERE helpful_votes > 3 AND vine = 'Y'
-- avg rating for verified purchases is 4.06