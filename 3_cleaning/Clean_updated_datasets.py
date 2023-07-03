import pandas as pd
import sqlite3
import os

# Load updated the datasets
relative_path = 'updated_datasets'
current_dir = os.getcwd()
absolute_path = os.path.join(current_dir, relative_path)

movies_df = pd.read_csv(absolute_path)


movies_df = pd.read_csv(relative_path"/movies.csv")
ratings_df = pd.read_csv(relative_path/"ratings.csv")
revenues_df = pd.read_csv(relative_path/"revenues.csv")

