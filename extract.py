from pytrends.request import TrendReq
import pandas as pd
import time 

# create a connection to Google Trends
pytrend = TrendReq()

brands = ["Rare Beauty", "Rhode", "Sacheu", "Youthforia", "Drunk Elephant", "Fenty Beauty", "Beauty of Joseon"]

# search these terms for the last 12 months, cap at 5 a time
pytrend.build_payload(brands[:5], timeframe='today 12-m')
df = pytrend.interest_over_time()
# print(df.to_string())

time.sleep(10)

pytrend.build_payload(brands[5:], timeframe='today 12-m')
df2 = pytrend.interest_over_time()
# print(df2.to_string())

# combine the two dataframes
df_combined = pd.concat([df, df2], axis=1)
df_combined = df_combined.loc[:, df_combined.columns != 'isPartial']
df_combined.to_csv('../data/raw_trends.csv')
print(df_combined.to_string())