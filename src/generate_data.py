import pandas as pd
import numpy as np

np.random.seed(42)

products = [
    "Laptop",
    "Mouse",
    "Keyboard",
    "Monitor",
    "Headphones",
    "Webcam",
    "Printer",
    "Tablet"
]

categories = {
    "Laptop": "Electronics",
    "Mouse": "Accessories",
    "Keyboard": "Accessories",
    "Monitor": "Electronics",
    "Headphones": "Accessories",
    "Webcam": "Accessories",
    "Printer": "Electronics",
    "Tablet": "Electronics"
}

regions = ["North", "South", "East", "West"]

n = 500

data = {
    "Order_ID": range(1001, 1001 + n),
    "Order_Date": pd.date_range(
        start="2025-01-01",
        periods=n,
        freq="D"
    ),
    "Customer_ID": np.random.randint(10001, 10101, n),
    "Product": np.random.choice(products, n),
    "Region": np.random.choice(regions, n),
    "Quantity": np.random.randint(1, 10, n),
    "Unit_Price": np.random.choice(
        [25, 50, 75, 100, 200, 300, 500, 800],
        n
    ),
    "Discount": np.random.choice(
        [0, 0.05, 0.10, 0.15, 0.20],
        n
    )
}

df = pd.DataFrame(data)

df["Category"] = df["Product"].map(categories)

df["Sales"] = (
    df["Quantity"]
    * df["Unit_Price"]
    * (1 - df["Discount"])
)

df["Profit"] = df["Sales"] * np.random.uniform(
    0.10, 0.30, n
)

# Add a few missing values intentionally
df.loc[10, "Region"] = np.nan
df.loc[25, "Unit_Price"] = np.nan
df.loc[40, "Customer_ID"] = np.nan

# Add duplicate records intentionally
df = pd.concat(
    [df, df.iloc[[5, 15, 25]]],
    ignore_index=True
)

df.to_csv(
    "../data/sales_data.csv",
    index=False
)

print("Dataset created successfully!")
print(f"Rows: {len(df)}")
print(f"Columns: {len(df.columns)}")