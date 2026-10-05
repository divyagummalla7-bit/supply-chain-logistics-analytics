# Supply Chain & Logistics Analytics

An end-to-end supply chain analytics project using **Python, SQL, MySQL, Power BI, and Machine Learning** to analyze sales, profitability, shipping performance, delivery delays, customer segments, and product demand.

## 📌 Project Overview

This project analyzes the **DataCo Supply Chain dataset**, containing more than 180,000 order-item records.

The project covers:

* Data exploration and cleaning using Python
* Exploratory Data Analysis (EDA)
* SQL business analysis using MySQL
* Advanced SQL and window functions
* Power BI dashboard development
* Demand forecasting
* ABC product classification
* Late-delivery prediction
* Machine learning model evaluation
* Data quality validation
* Git/GitHub project version control

## 🗂️ Project Structure

```text
supply-chain-logistics-analytics/
│
├── dashboard/
│   └── app.py
│
├── data/
│   └── processed/
│       └── project_documentation.txt
│
├── notebooks/
│   └── 01_data_exploration.ipynb
│
├── sql/
│   ├── 01_kpi_analysis.sql
│   ├── 02_shipping_delivery_analysis.sql
│   ├── 03_regional_sales_analysis.sql
│   ├── ...
│   └── 30_delivery_status_conditional.sql
│
├── requirements.txt
├── run_project.py
├── .gitignore
└── README.md
```

## 📊 Dataset

| **Metric**         | **Value** |
| ------------------ | --------: |
| Records            |   180,519 |
| Unique Orders      |    65,752 |
| Unique Order Items |   180,519 |
| Product Categories |        50 |
| Regions            |        23 |
| Markets            |         5 |
| Customer Segments  |         3 |
| Departments        |        11 |

Raw/private source data is excluded from the GitHub repository.

## 💰 Key Business KPIs

| **KPI**                         | **Value** |
| ------------------------------- | --------: |
| Total Sales                     |   $36.78M |
| Total Profit                    |    $3.97M |
| Total Quantity                  |   384,079 |
| Total Orders                    |    65,752 |
| Order Items                     |   180,519 |
| Late Delivery Rate              |    54.83% |
| Average Actual Shipping Time    | 3.50 days |
| Average Scheduled Shipping Time | 2.93 days |

## 🔍 SQL Analysis

The project contains **30 SQL analysis scripts** covering:

* Business KPIs
* Shipping and delivery performance
* Regional sales
* Customer segmentation
* Shipping mode analysis
* Monthly sales trends
* Monthly order analysis
* Product and category analysis
* Profitability analysis
* Category profit margins
* Top products by category
* Department analysis
* `ROW_NUMBER()`
* `RANK()` and `DENSE_RANK()`
* `LAG()`
* `LEAD()`
* Cumulative sales
* Conditional aggregation

## 📈 Power BI Dashboard

The Power BI dashboard provides analysis of:

* Sales performance
* Profitability
* Monthly demand trends
* Product categories
* Customer segments
* Shipping performance
* Delivery delays
* Regional performance
* Demand forecasting
* ABC product prioritization
* Late-delivery prediction
* Model evaluation
* Decomposition tree analysis

## 🤖 Machine Learning

Machine learning was used to analyze delivery risk and demand patterns.

### Late-Delivery Prediction

Models evaluated:

* Logistic Regression
* Random Forest

Evaluation metrics:

* ROC-AUC
* Precision
* Recall
* F1 Score
* Confusion Matrix

The models achieved approximately **0.73 ROC-AUC**.

### Demand Forecasting

Monthly demand analysis was used to identify historical trends, seasonality, and future demand patterns.

## 🧮 ABC Analysis

Products were classified according to their contribution to sales:

* **A** — highest-value products
* **B** — medium-value products
* **C** — lower-value products

This supports inventory prioritization and supply planning.

## 🚚 Delivery Insights

Shipping-mode analysis identified significant differences in delivery performance.

First Class and Second Class shipments showed substantially higher late-delivery rates than Standard Class shipments.

This highlights the importance of:

* Shipping mode selection
* Delivery scheduling
* Regional logistics
* Operational bottlenecks
* Customer expectations

## 🧹 Data Quality

The project includes validation checks for:

* Duplicate order items
* Missing analytical fields
* Invalid delivery dates
* Shipping-before-order records
* Shipping duration
* Delivery-risk values
* Sales validity
* Quantity validity
* Database indexes

The analytical SQL view contains business-relevant fields and excludes sensitive customer information.

## 🛠️ Technologies

* Python
* Pandas
* NumPy
* SciPy
* Statsmodels
* Scikit-learn
* Jupyter Notebook
* MySQL
* SQL
* Power BI
* Streamlit
* FastAPI
* Git
* GitHub

## ▶️ Running the Project

### Clone the repository

```bash
git clone https://github.com/divyagummalla7-bit/supply-chain-logistics-analytics.git
cd supply-chain-logistics-analytics
```

### Create a virtual environment

```bash
python -m venv venv
```

### Activate the environment on Windows

```bash
venv\Scripts\activate
```

### Install dependencies

```bash
pip install -r requirements.txt
```

### Run the project

```bash
python run_project.py
```

The Streamlit dashboard will open locally.

## 🔐 Data Privacy

Raw source data is intentionally excluded from this repository.

Sensitive customer information such as email addresses, passwords, and customer addresses is not published.

## 📌 Business Value

This project demonstrates how supply chain data can be transformed into actionable business insights.

The analysis can help organizations:

* Identify delivery-risk factors
* Monitor sales and profitability
* Prioritize high-value products
* Improve inventory planning
* Compare shipping modes
* Identify regional performance differences
* Forecast demand
* Support operational decision-making

## 👤 Author

**Durga Kadali**

---

⭐ If you find this project useful, consider giving the repository a star.
