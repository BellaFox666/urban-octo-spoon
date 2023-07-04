-- to save some time in quering on the database, we have removed the half of movies table (which has 61830 rows)
-- DELETE FROM movies
-- ORDER BY RAND()
-- LIMIT 30000;

-- Remove duplicate rows from movies table
DELETE m1
FROM movies m1, movies m2
WHERE m1.movieId > m2.movieId
AND m1.title = m2.title
AND m1.genres = m2.genres
AND m1.year = m2.year;
-- 404 rows affected

-- remove duplicates based on movie title and year from movies table
DELETE m1
FROM movies m1
JOIN movies m2 ON m1.title = m2.title AND m1.year = m2.year AND m1.movieId > m2.movieId;
-- 216 rows affected

-- remove duplicated titles
DELETE m1
FROM movies m1
INNER JOIN (
    SELECT title, MIN(movieId) AS minMovieId
    FROM movies
    GROUP BY title
    HAVING COUNT(*) > 1
) m2 ON m1.title = m2.title AND m1.movieId > m2.minMovieId;
-- 5402 rows affected


-- Remove duplicate rows from revenues table
DELETE r1
FROM revenues r1, revenues r2
WHERE r1.revenueId > r2.revenueId
AND r1.title = r2.title
AND r1.revenue = r2.revenue
AND r1.year = r2.year;
-- 183 affected

-- removing duplicated revenues for the same title 
DELETE r1
FROM revenues r1, revenues r2
WHERE r1.title = r2.title
AND r1.revenue < r2.revenue;


-- Remove duplicate rows from ratings table
DELETE rat1
FROM ratings rat1, ratings rat2
WHERE rat1.ratingId > rat2.ratingId
AND rat1.userId = rat2.userId
AND rat1.movieId = rat2.movieId
AND rat1.rating = rat2.rating;
-- 0 rows affected


-- Update missing values in movies table
UPDATE movies
SET year = ''
WHERE year IS NULL;

-- Update missing values in revenues table
UPDATE revenues
SET revenue = 0
WHERE revenue IS NULL;

-- Update missing values in ratings table
UPDATE ratings
SET rating = 0.0
WHERE rating IS NULL;

-- remove rows with empty title from movies table
DELETE FROM movies
WHERE title = '';
-- 52 riws affected

-- Convert year column in movies table to integer
ALTER TABLE movies
MODIFY COLUMN year INT;

-- Convert revenue column in revenues table to decimal(15, 5)
ALTER TABLE revenues
MODIFY COLUMN revenue DECIMAL(20, 5);

-- Convert rating column in ratings table to decimal(5, 2)
ALTER TABLE ratings
MODIFY COLUMN rating DECIMAL(5, 2);

-- remove the the brackets with the content to the end if the title in the movies table contains brackets within (which means the name in the original movie language, to keep only english names)
UPDATE movies
SET title = TRIM(SUBSTRING_INDEX(title, '(', 1));
-- 4744 rows affected

-- remove the comma and everything after it in the title column of the movies table
UPDATE movies
SET title = SUBSTRING_INDEX(title, ',', 1)
WHERE title LIKE '%,%';
-- 6609 affected

-- Note: The comparison of the results can be found in the folder showcase