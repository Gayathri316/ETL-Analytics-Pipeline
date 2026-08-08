import pandas as pd


# -----------------------------
# EXTRACT
# -----------------------------

file_path = "../data/sales_data.csv"

df = pd.read_csv(file_path)

print("Data extracted successfully!")

print("Number of rows:", len(df))
print("Number of columns:", len(df.columns))


# -----------------------------
# DATA PROFILING
# -----------------------------

print("\nFirst 5 rows:")
print(df.head())

print("\nDataset Information:")
df.info()

print("\nMissing Values:")
print(df.isnull().sum())

print("\nDuplicate Rows:")
print(df.duplicated().sum())

print("\nStatistical Summary:")
print(df.describe())


# -----------------------------
# TRANSFORM - HANDLE MISSING VALUES
# -----------------------------

df["Region"] = df["Region"].fillna("Unknown")

df["Customer_ID"] = df["Customer_ID"].fillna("Unknown")

df["Unit_Price"] = df["Unit_Price"].fillna(
    df["Unit_Price"].median()
)


print("\nMissing values after cleaning:")
print(df.isnull().sum())


# -----------------------------
# REMOVE DUPLICATE RECORDS
# -----------------------------

df = df.drop_duplicates()

print("\nRows after removing duplicates:")
print(len(df))


# -----------------------------
# RECALCULATE DERIVED COLUMNS
# -----------------------------

df["Sales"] = (
    df["Quantity"]
    * df["Unit_Price"]
    * (1 - df["Discount"])
)

df["Profit"] = df["Sales"] * 0.20


print("\nData transformation completed!")
print("\nFinal dataset shape:")
print(df.shape)

# -----------------------------
# SAVE CLEANED DATA
# -----------------------------

output_path = "../data/cleaned_sales_data.csv"

df.to_csv(
    output_path,
    index=False
)

print("\nCleaned data saved successfully!")
print("Saved to:", output_path)