-- In MySQL lcoally, "dataintegration" database has been created and connection has been configured

use dataintegration

-- Create the movies table
CREATE TABLE movies (
    movieId INT PRIMARY KEY,
    title VARCHAR(255),
    genres VARCHAR(255),
    year VARCHAR(255)
);

-- Create the revenues table
CREATE TABLE revenues (
    revenueId INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    revenue DECIMAL(20, 5),
    distributor VARCHAR(255),
    year INT,
    FOREIGN KEY (title, year) REFERENCES movies(title, year)
);

-- Create the ratings table
CREATE TABLE ratings (
    ratingId INT PRIMARY KEY AUTO_INCREMENT,
    userId INT,
    movieId INT,
    rating DECIMAL(2, 1),
    FOREIGN KEY (movieId) REFERENCES movies(movieId)
);

-- -------------------------------------

-- Insert data into db tables
LOAD DATA infile './updated_datasets/movies_updated.csv'
INTO TABLE movies
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS

LOAD DATA infile './updated_datasets/revenues_updated.csv'
INTO TABLE revenues
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS

LOAD DATA infile './updated_datasets/ratings_updated.csv'
INTO TABLE ratings
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS

