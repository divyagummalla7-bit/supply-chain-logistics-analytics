import streamlit as st
import pandas as pd
import plotly.express as px

# =========================================================
# PAGE CONFIG
# =========================================================

st.set_page_config(
    page_title="Supply Chain Analytics",
    page_icon="📦",
    layout="wide",
    initial_sidebar_state="expanded"
)

# =========================================================
# CUSTOM CSS
# =========================================================

st.markdown("""
<style>

    /* Main background */
    .stApp {
        background-color: #f5f7fb;
    }

    /* Main content */
    .block-container {
        padding-top: 1.5rem;
        padding-bottom: 2rem;
        max-width: 1500px;
    }

    /* Sidebar */
    section[data-testid="stSidebar"] {
        background-color: #172033;
    }

    section[data-testid="stSidebar"] * {
        color: white;
    }

    /* Header */
    .dashboard-header {
        background: linear-gradient(135deg, #172033, #263b63);
        padding: 25px 30px;
        border-radius: 15px;
        margin-bottom: 25px;
        color: white;
        box-shadow: 0 4px 15px rgba(0,0,0,0.08);
    }

    .dashboard-header h1 {
        margin: 0;
        font-size: 32px;
        font-weight: 700;
    }

    .dashboard-header p {
        margin: 8px 0 0 0;
        font-size: 15px;
        opacity: 0.85;
    }

    /* KPI cards */
    .kpi-card {
        background: white;
        padding: 20px;
        border-radius: 14px;
        border: 1px solid #e5e9f2;
        box-shadow: 0 3px 12px rgba(0,0,0,0.05);
        min-height: 115px;
    }

    .kpi-title {
        color: #6b7280;
        font-size: 14px;
        font-weight: 600;
        margin-bottom: 8px;
    }

    .kpi-value {
        color: #172033;
        font-size: 26px;
        font-weight: 700;
    }

    /* Section title */
    .section-title {
        color: #172033;
        font-size: 21px;
        font-weight: 700;
        margin-top: 25px;
        margin-bottom: 12px;
    }

    /* Info box */
    .info-box {
        background: white;
        border-left: 5px solid #3b82f6;
        padding: 15px 18px;
        border-radius: 10px;
        margin-bottom: 18px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.04);
    }

    /* Footer */
    .footer {
        text-align: center;
        color: #6b7280;
        font-size: 13px;
        padding: 25px 0 10px 0;
    }

</style>
""", unsafe_allow_html=True)

# =========================================================
# LOAD DATA
# =========================================================

DATA_PATH = "data/processed/final_analytical_dataset.csv"

@st.cache_data
def load_data():
    data = pd.read_csv(DATA_PATH)
    data["order date (DateOrders)"] = pd.to_datetime(
        data["order date (DateOrders)"]
    )
    return data


df = load_data()

# =========================================================
# SIDEBAR
# =========================================================

st.sidebar.markdown("## 📦 Supply Chain")
st.sidebar.markdown("---")

st.sidebar.markdown("### 🔎 Dashboard Filters")

markets = sorted(df["Market"].dropna().unique())
segments = sorted(df["Customer Segment"].dropna().unique())
shipping_modes = sorted(df["Shipping Mode"].dropna().unique())

selected_markets = st.sidebar.multiselect(
    "Market",
    markets,
    default=markets
)

selected_segments = st.sidebar.multiselect(
    "Customer Segment",
    segments,
    default=segments
)

selected_shipping = st.sidebar.multiselect(
    "Shipping Mode",
    shipping_modes,
    default=shipping_modes
)

st.sidebar.markdown("---")

st.sidebar.markdown(
    """
    **Dashboard**
    
    Supply Chain & Logistics Analytics
    
    **Data**
    
    180,519 order items
    
    **Technology**
    
    Python • Pandas • Streamlit • Plotly
    """
)

# =========================================================
# FILTER DATA
# =========================================================

filtered_df = df[
    df["Market"].isin(selected_markets)
    & df["Customer Segment"].isin(selected_segments)
    & df["Shipping Mode"].isin(selected_shipping)
].copy()

# =========================================================
# KPI CALCULATIONS
# =========================================================

total_orders = filtered_df["Order Id"].nunique()
total_items = filtered_df["Order Item Id"].nunique()
total_sales = filtered_df["Sales"].sum()
total_profit = filtered_df["Order Profit Per Order"].sum()
total_quantity = filtered_df["Order Item Quantity"].sum()

late_rate = (
    filtered_df["Late_delivery_risk"].mean() * 100
    if len(filtered_df) else 0
)

avg_actual = (
    filtered_df["Days for shipping (real)"].mean()
    if len(filtered_df) else 0
)

avg_scheduled = (
    filtered_df["Days for shipment (scheduled)"].mean()
    if len(filtered_df) else 0
)

profit_margin = (
    total_profit / total_sales * 100
    if total_sales else 0
)

# =========================================================
# HEADER
# =========================================================

st.markdown(
    """
    <div class="dashboard-header">
        <h1>📦 Supply Chain & Logistics Analytics</h1>
        <p>
        Executive dashboard for sales, profitability,
        customers, products and delivery performance
        </p>
    </div>
    """,
    unsafe_allow_html=True
)

# =========================================================
# FILTER STATUS
# =========================================================

st.markdown(
    f"""
    <div class="info-box">
        <b>Dashboard Status:</b>
        Showing {len(filtered_df):,} order-item records
        after applying the selected filters.
    </div>
    """,
    unsafe_allow_html=True
)

# =========================================================
# KPI SECTION
# =========================================================

st.markdown(
    '<div class="section-title">📊 Key Performance Indicators</div>',
    unsafe_allow_html=True
)

kpi1, kpi2, kpi3, kpi4, kpi5 = st.columns(5)

with kpi1:
    st.markdown(
        f"""
        <div class="kpi-card">
            <div class="kpi-title">TOTAL ORDERS</div>
            <div class="kpi-value">{total_orders:,}</div>
        </div>
        """,
        unsafe_allow_html=True
    )

with kpi2:
    st.markdown(
        f"""
        <div class="kpi-card">
            <div class="kpi-title">TOTAL SALES</div>
            <div class="kpi-value">${total_sales/1_000_000:.2f}M</div>
        </div>
        """,
        unsafe_allow_html=True
    )

with kpi3:
    st.markdown(
        f"""
        <div class="kpi-card">
            <div class="kpi-title">TOTAL PROFIT</div>
            <div class="kpi-value">${total_profit/1_000_000:.2f}M</div>
        </div>
        """,
        unsafe_allow_html=True
    )

with kpi4:
    st.markdown(
        f"""
        <div class="kpi-card">
            <div class="kpi-title">LATE DELIVERY</div>
            <div class="kpi-value">{late_rate:.2f}%</div>
        </div>
        """,
        unsafe_allow_html=True
    )

with kpi5:
    st.markdown(
        f"""
        <div class="kpi-card">
            <div class="kpi-title">PROFIT MARGIN</div>
            <div class="kpi-value">{profit_margin:.2f}%</div>
        </div>
        """,
        unsafe_allow_html=True
    )

# =========================================================
# SECOND KPI ROW
# =========================================================

st.write("")

kpi6, kpi7, kpi8, kpi9 = st.columns(4)

with kpi6:
    st.metric("📦 Order Items", f"{total_items:,}")

with kpi7:
    st.metric("📦 Quantity Sold", f"{total_quantity:,}")

with kpi8:
    st.metric("🚚 Actual Shipping", f"{avg_actual:.2f} days")

with kpi9:
    st.metric("📅 Scheduled Shipping", f"{avg_scheduled:.2f} days")

# =========================================================
# SALES & PROFIT
# =========================================================

st.markdown(
    '<div class="section-title">📈 Sales & Profit Performance</div>',
    unsafe_allow_html=True
)

col1, col2 = st.columns(2)

# Sales by market
with col1:

    sales_market = (
        filtered_df.groupby("Market")["Sales"]
        .sum()
        .reset_index()
        .sort_values("Sales", ascending=False)
    )

    fig = px.bar(
        sales_market,
        x="Market",
        y="Sales",
        title="Sales by Market",
        text_auto=".2s"
    )

    fig.update_layout(
        plot_bgcolor="white",
        paper_bgcolor="white",
        margin=dict(l=20, r=20, t=60, b=20)
    )

    st.plotly_chart(fig, width='stretch')

# Profit by market
with col2:

    profit_market = (
        filtered_df.groupby("Market")["Order Profit Per Order"]
        .sum()
        .reset_index()
        .sort_values("Order Profit Per Order", ascending=False)
    )

    fig = px.bar(
        profit_market,
        x="Market",
        y="Order Profit Per Order",
        title="Profit by Market",
        text_auto=".2s"
    )

    fig.update_layout(
        plot_bgcolor="white",
        paper_bgcolor="white",
        margin=dict(l=20, r=20, t=60, b=20)
    )

    st.plotly_chart(fig, width='stretch')

# =========================================================
# MONTHLY SALES
# =========================================================

monthly_sales = (
    filtered_df
    .groupby(
        filtered_df["order date (DateOrders)"].dt.to_period("M")
    )["Sales"]
    .sum()
    .reset_index()
)

monthly_sales["order date (DateOrders)"] = (
    monthly_sales["order date (DateOrders)"].astype(str)
)

fig = px.line(
    monthly_sales,
    x="order date (DateOrders)",
    y="Sales",
    markers=True,
    title="Monthly Sales Trend"
)

fig.update_layout(
    plot_bgcolor="white",
    paper_bgcolor="white"
)

st.plotly_chart(fig, width='stretch')

# =========================================================
# DELIVERY
# =========================================================

st.markdown(
    '<div class="section-title">🚚 Delivery Performance</div>',
    unsafe_allow_html=True
)

col1, col2 = st.columns(2)

with col1:

    shipping_delivery = (
        filtered_df.groupby("Shipping Mode")
        .agg(
            Late_Rate=("Late_delivery_risk", "mean"),
            Actual_Days=("Days for shipping (real)", "mean"),
            Scheduled_Days=("Days for shipment (scheduled)", "mean")
        )
        .reset_index()
    )

    shipping_delivery["Late_Rate"] *= 100

    fig = px.bar(
        shipping_delivery,
        x="Shipping Mode",
        y="Late_Rate",
        title="Late Delivery Rate by Shipping Mode",
        text_auto=".2f"
    )

    fig.update_layout(
        plot_bgcolor="white",
        paper_bgcolor="white"
    )

    st.plotly_chart(fig, width='stretch')

with col2:

    delivery_status = (
        filtered_df["Delivery Status"]
        .value_counts()
        .reset_index()
    )

    delivery_status.columns = [
        "Delivery Status",
        "Count"
    ]

    fig = px.pie(
        delivery_status,
        names="Delivery Status",
        values="Count",
        hole=0.45,
        title="Delivery Status Distribution"
    )

    fig.update_layout(
        paper_bgcolor="white"
    )

    st.plotly_chart(fig, width='stretch')

# =========================================================
# PRODUCTS & CUSTOMERS
# =========================================================

st.markdown(
    '<div class="section-title">📦 Products & Customers</div>',
    unsafe_allow_html=True
)

col1, col2 = st.columns(2)

with col1:

    top_products = (
        filtered_df.groupby("Product Name")["Sales"]
        .sum()
        .reset_index()
        .sort_values("Sales", ascending=False)
        .head(10)
    )

    fig = px.bar(
        top_products.sort_values("Sales"),
        x="Sales",
        y="Product Name",
        orientation="h",
        title="Top 10 Products by Sales",
        text_auto=".2s"
    )

    fig.update_layout(
        plot_bgcolor="white",
        paper_bgcolor="white"
    )

    st.plotly_chart(fig, width='stretch')

with col2:

    segment_sales = (
        filtered_df.groupby("Customer Segment")["Sales"]
        .sum()
        .reset_index()
    )

    fig = px.pie(
        segment_sales,
        names="Customer Segment",
        values="Sales",
        hole=0.45,
        title="Sales by Customer Segment"
    )

    fig.update_layout(
        paper_bgcolor="white"
    )

    st.plotly_chart(fig, width='stretch')

# =========================================================
# CATEGORY
# =========================================================

category_sales = (
    filtered_df.groupby("Category Name")["Sales"]
    .sum()
    .reset_index()
    .sort_values("Sales", ascending=False)
    .head(10)
)

fig = px.bar(
    category_sales.sort_values("Sales"),
    x="Sales",
    y="Category Name",
    orientation="h",
    title="Top 10 Product Categories by Sales",
    text_auto=".2s"
)

fig.update_layout(
    plot_bgcolor="white",
    paper_bgcolor="white"
)

st.plotly_chart(fig, width='stretch')

# =========================================================
# DATA EXPLORER
# =========================================================

st.markdown(
    '<div class="section-title">📋 Data Explorer</div>',
    unsafe_allow_html=True
)

st.dataframe(
    filtered_df,
    width='stretch',
    height=500
)

csv_data = filtered_df.to_csv(index=False).encode("utf-8")

st.download_button(
    label="⬇️ Download Filtered Data",
    data=csv_data,
    file_name="filtered_supply_chain_data.csv",
    mime="text/csv"
)

# =========================================================
# FOOTER
# =========================================================

st.markdown(
    """
    <div class="footer">
        Supply Chain & Logistics Analytics Project<br>
        Python • Pandas • Streamlit • Plotly
    </div>
    """,
    unsafe_allow_html=True
)