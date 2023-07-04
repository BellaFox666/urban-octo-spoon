-- Here are some examples of the comparison between results before and after data cleaning and before it, (we have cloned the movies table before cleaning to movies_before_cleaning table to compare the results with it)
SELECT m.title, r.revenue
FROM movies_before_cleaning m
JOIN revenues r ON m.title = r.title;
-- 94999 rows returned
-- again with movies table
SELECT m.title, r.revenue
FROM movies m
JOIN revenues r ON m.title = r.title;
-- 75639 rows returned

-- show duplicated data grouped by title on movies_before_cleaning table
SELECT title, COUNT(*) AS duplicate_count
FROM movies_before_cleaning
GROUP BY title
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;
-- 2837 rows returned

-- again with movies table
SELECT title, COUNT(*) AS duplicate_count
FROM movies
GROUP BY title
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;

-- show how many rows before and after data cleaning
SELECT COUNT(*) AS total_rows_before FROM movies_before_cleaning; -- 62423
SELECT COUNT(*) AS total_rows_before FROM movies; -- 56349

-- show the revenues of movies for the year 2005
SELECT m.title, r.revenue
FROM movies m
INNER JOIN revenues r ON m.title = r.title
WHERE m.year = 2005;
-- 136 rows returned
-- again for movies_before_cleaning 
SELECT m.title, r.revenue
FROM movies_before_cleaning m
INNER JOIN revenues r ON m.title = r.title
WHERE m.year = 2005;
-- 166 rows returned

-- show top rating movies of year 2000
select m.title, avg(r.rating) as avrg from ratings r, movies m
where m.movieId = r.movieId
and m.year = 2000
group by m.title
order by avrg desc
limit 10

-- show top 10 film revenues in year 2000
SELECT m.title, r.revenue
FROM movies_before_cleaning m
INNER JOIN revenues r ON m.title = r.title
WHERE r.year = 2000
ORDER BY r.revenue DESC
LIMIT 10;
