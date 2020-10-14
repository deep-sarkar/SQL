import pandas as pd

df = pd.read_csv('dataframe/CpuLogData2019-09-18.csv')

# convert DateTime column as datetime object
# df['DateTime'] = pd.to_datetime(df.DateTime)
# print(df.DateTime.dt.date)
# print(df.DateTime.dt.time)
# print(df['technology'])
# print(df.sort_values(['Cpu Working Time'],ascending=True))
# print(df.head())
# print(df.agg(['sum']))

# SHAPE OF DF
# print(df.shape)



# Table of all aggrigation function for all numerical column
# print(df.describe())

# Group by
# group = df.groupby(['user_name'])
# print(list(group['user_name']))

# data type for all the columns value
# print(df.dtypes)

# DATETIME
# print(df.DateTime.str.slice(-5,-3))

# ts = pd.to_datetime('18/09/2019 08:30:00')
# print(ts)
# print(df.DateTime.min())
# print(df.DateTime.max() - df.DateTime.min())
# print(df.DateTime.dt.date == pd.to_datetime('18/09/2019'))
# Ddata = df[df.DateTime.dt.date == pd.to_datetime('18/09/2019')]

# print(list(Ddata.groupby(['user_name'])))






# 1.Aggtigation functions
# print('min : ',df.mouse.min())
# print('max : ',df.mouse.max())
# print('avg : ',df.mouse.mean())

# Multiple agg
# print(df.mouse.agg(['min','mean','max']))

# Agg for whole table
# print(df.describe())



# 2. Mouse 0 and keyboard 0
# print(df[(df.mouse == 0) & (df.keyboard == 0) ].user_name.count())

# 3. Attendance of all users based on 3 days
# user_on_pertiular_date = df.groupby([df['DateTime'].dt.date,'user_name'])
# print(user_on_pertiular_date.user_name.describe().groupby('user_name').count())

#  4.Working hours for perticular user
# working_hours = df[(df.DateTime.dt.date == pd.to_datetime('18/09/2019')) & (df.user_name == 'markfernandes66@gmail.com')]
# print(working_hours.DateTime.max() - working_hours.DateTime.min())

# 5.Late hours
# print(working_hours.DateTime.min() - pd.to_datetime('18/09/2019 08:30'))