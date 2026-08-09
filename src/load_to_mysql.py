import pandas as pd
import mysql.connector
from dotenv import load_dotenv
import os

load_dotenv()

# -----------------------------
# LOAD DATA
# -----------------------------

file_path = "../data/cleaned_sales_data.csv"

df = pd.read_csv(file_path)

print("Cleaned data loaded from CSV.")
print("Rows:", len(df))
print("Columns:", len(df.columns))


# -----------------------------
# CONNECT TO MYSQL
# -----------------------------

connection = mysql.connector.connect(
    host=os.getenv("DB_HOST"),
    user=os.getenv("DB_USER"),
    password=os.getenv("DB_PASSWORD"),
    database=os.getenv("DB_NAME")
)

cursor = connection.cursor()

print("Connected to MySQL successfully!")
# -----------------------------
# INSERT DATA INTO MYSQL
# -----------------------------
insert_query = """
INSERT INTO sales (
    Order_ID,
    Order_Date,
    Customer_ID,
    Product,
    Region,
    Quantity,
    Unit_Price,
    Discount,
    Category,
    Sales,
    Profit
)
VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
ON DUPLICATE KEY UPDATE
    Order_Date = VALUES(Order_Date),
    Customer_ID = VALUES(Customer_ID),
    Product = VALUES(Product),
    Region = VALUES(Region),
    Quantity = VALUES(Quantity),
    Unit_Price = VALUES(Unit_Price),
    Discount = VALUES(Discount),
    Category = VALUES(Category),
    Sales = VALUES(Sales),
    Profit = VALUES(Profit)
"""

for _, row in df.iterrows():

    values = (
        int(row["Order_ID"]),
        row["Order_Date"],
        str(row["Customer_ID"]),
        row["Product"],
        row["Region"],
        int(row["Quantity"]),
        float(row["Unit_Price"]),
        float(row["Discount"]),
        row["Category"],
        float(row["Sales"]),
        float(row["Profit"])
    )

    cursor.execute(insert_query, values)

connection.commit()

print("Data loaded successfully into MySQL!")