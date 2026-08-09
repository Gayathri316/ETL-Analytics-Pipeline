import pandas as pd
import mysql.connector


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
    host="localhost",
    user="root",
    password="Gayathri@123",
    database="sales_analytics"
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