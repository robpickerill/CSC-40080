"""
this script was used to perform more advanced data preprocessing
then weka could offer.
"""


import pandas as pd


# load the ARFF file
df = pd.read_csv("city_day.arff")


# convert bytes to datetime
df['Date'] = pd.to_datetime(df['Date'])


# convert the date column to the relevant columns
df['Day'] = df['Date'].dt.day
df['Month'] = df['Date'].dt.month
df['Year'] = df['Date'].dt.year
df['DayOfWeek'] = df['Date'].dt.day_of_week
df.drop('Date', axis=1, inplace=True)


# reorder the columns
df = df[['Day', 'Month', 'Year', 'DayOfWeek', 'PM2.5', 'PM10', 'NO', 'NO2', 'NOx', 'NH3', 'CO', 'SO2', 'O3', 'Benzene', 'Toluene', 'AQI']]


# remove the AQI rows with missing values
df.dropna(subset=['AQI'], inplace=True, how='all')


df.to_csv("dataset.csv", index=False)
