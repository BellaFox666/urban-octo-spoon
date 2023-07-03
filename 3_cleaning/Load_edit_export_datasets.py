import pandas as pd
import mysql.connector
import sqlite3

# Load the datasets
movies_df = pd.read_csv('./raw_datasets/movies.csv')
ratings_df = pd.read_csv('./raw_datasets/ratings.csv')
revenues_df = pd.read_csv('./raw_datasets/revenues.csv')


## movies dataset
# Extract the release year from the title column
movies_df['year'] = movies_df['title'].str.extract(r'\((\d{4})\)')
# Replace missing values in 'year' column with an empty string
movies_df['year'].fillna('', inplace=True)
# Remove the year from the title column
movies_df['title'] = movies_df['title'].str.extract(r'^(.*) \(\d{4}\)$')

## revenues dataset
# Drop id and theaters columns
revenues_df.drop('id', axis=1, inplace=True)
revenues_df.drop('theaters', axis=1, inplace=True)

# Extract the year from the 'date' column
revenues_df['year'] = pd.to_datetime(revenues_df['date']).dt.year
# Drop the 'date' column
revenues_df.drop('date', axis=1, inplace=True)
# Create a new column 'revenueId' with incremental integers
revenues_df.insert(0, 'revenueId', range(1, len(revenues_df) + 1))


## ratings dataset
# Drop the 'timestamp' column
ratings_df.drop('timestamp', axis=1, inplace=True)
# Create a new column 'ratingId' with incremental integers
ratings_df.insert(0, 'ratingId', range(1, len(ratings_df) + 1))

# Export all three DataFrames to a new CSV files
movies_df.to_csv("./updated_datasets/movies_updated.csv", index=False)
revenues_df.to_csv('./updated_datasets/revenues_updated.csv', index=False)
ratings_df.to_csv('./updated_datasets/ratings_updated.csv', index=False)


