import pandas as pd
import random
from datetime import timedelta

# 1. Read the Excel file
input_file = 'D:/Learning/DATA PROJECT/02 Marketing campaign/marketing_data.xlsx'
try:
    df = pd.read_excel(input_file)
    print("✅ File loaded successfully:")
    print(df.head())
except Exception as e:
    print("❌ Error while reading the file:", e)
    exit()

# 2. Parse the registration date column
column_name = 'Dt_Customer'  # Actual column name in your file

if column_name in df.columns:
    df[column_name] = pd.to_datetime(df[column_name], errors='coerce')
    print(f"\n✅ Column '{column_name}' loaded and converted:")
    print(df[[column_name]].head())
else:
    print(f"❌ Column '{column_name}' not found in the file.")
    print(f"Available columns: {list(df.columns)}")
    exit()

# 3. Generate a random transaction date within a fixed range (June 2012 – June 2014)
date_range_start = pd.Timestamp('2012-06-01')
date_range_end = pd.Timestamp('2014-06-30')

def generate_random_date_within_range(reg_date):
    if pd.isna(reg_date):
        return None
    # Start date is the later of registration date or range start
    start = max(reg_date, date_range_start)
    end = date_range_end
    if start > end:
        return None  # Registration is outside the allowed range
    delta_days = (end - start).days
    random_days = random.randint(0, delta_days)
    return start + timedelta(days=random_days)

df['random_transaction_date'] = df[column_name].apply(generate_random_date_within_range)
print("\n✅ New column 'random_transaction_date' created:")
print(df[[column_name, 'random_transaction_date']].head())

# 4. Save the updated DataFrame to a new Excel file
output_file = 'D:/Learning/DATA PROJECT/02 Marketing campaign/marketing_data_with_transactions.xlsx'
try:
    df.to_excel(output_file, index=False)
    print(f"\n✅ File saved as '{output_file}'")
except Exception as e:
    print("❌ Error while saving the file:", e)
