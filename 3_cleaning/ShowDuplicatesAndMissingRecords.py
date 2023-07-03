import pandas as pd

# Load the updated datasets
movies_df = pd.read_csv('./updated_datasets/movies_updated.csv')
ratings_df = pd.read_csv('./updated_datasets/ratings_updated.csv')
revenues_df = pd.read_csv('./updated_datasets/revenues_updated.csv') 


## Show missing values for each dataframe
missing_movies = movies_df.isnull().sum()
print(missing_movies)

missing_revenues = revenues_df.isnull().sum()
print(missing_revenues)

missing_ratings = ratings_df.isnull().sum()
print(missing_ratings)

## show duplicates
duplicate_movies = movies_df[movies_df.duplicated()]
print(duplicate_movies)

duplicate_revenues = revenues_df[revenues_df.duplicated()]
print(duplicate_revenues)

duplicate_ratings = ratings_df[ratings_df.duplicated()]
print(duplicate_ratings)
 