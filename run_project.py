import subprocess
import sys
import pandas as pd


print("=" * 60)
print("SUPPLY CHAIN & LOGISTICS ANALYTICS PROJECT")
print("=" * 60)

# Load processed dataset
data_path = "data/processed/final_analytical_dataset.csv"
df = pd.read_csv(data_path)

# Calculate project KPIs
total_orders = df["Order Id"].nunique()
total_items = df["Order Item Id"].nunique()
total_sales = df["Sales"].sum()
total_profit = df["Order Profit Per Order"].sum()
total_quantity = df["Order Item Quantity"].sum()

late_delivery_rate = df["Late_delivery_risk"].mean() * 100
avg_actual = df["Days for shipping (real)"].mean()
avg_scheduled = df["Days for shipment (scheduled)"].mean()
profit_margin = (total_profit / total_sales) * 100


# Display results in terminal
print("\nPROJECT SUMMARY")
print("-" * 60)

print(f"Total Orders           : {total_orders:,}")
print(f"Total Order Items      : {total_items:,}")
print(f"Total Sales            : ${total_sales:,.2f}")
print(f"Total Profit           : ${total_profit:,.2f}")
print(f"Quantity Sold          : {total_quantity:,}")
print(f"Late Delivery Rate     : {late_delivery_rate:.2f}%")
print(f"Avg Actual Shipping    : {avg_actual:.2f} days")
print(f"Avg Scheduled Shipping : {avg_scheduled:.2f} days")
print(f"Profit Margin          : {profit_margin:.2f}%")

print("\n" + "=" * 60)
print("Starting dashboard...")
print("Dashboard: http://localhost:8501")
print("=" * 60)
print("\nKeep this terminal open while using the dashboard.")
print("Press CTRL+C to stop the project.\n")


# Start Streamlit dashboard
subprocess.run([
    sys.executable,
    "-m",
    "streamlit",
    "run",
    "dashboard/app.py"
])