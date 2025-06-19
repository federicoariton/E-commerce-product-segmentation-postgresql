# 🛍️ Olist E-commerce Marketing Analytics Dashboard

This project is a full-stack simulation of a **real-world marketing analytics solution** using open-source data from [Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce). The objective is to **recreate the end-to-end data lifecycle**—from raw e-commerce data to business insights—by building a relational database, applying analytical techniques, and delivering an interactive dashboard.

🎯 **Project Goal**:  
To replicate a real-world analytics workflow by:
- Collecting and exploring the Olist e-commerce dataset  
- Designing and implementing a PostgreSQL database  
- Performing data analysis and experimentation  
- Starting with a foundational analysis: **product performance segmentation**

---

## 🚀 Quick Access

- **Live Dashboard**: [Streamlit App](https://e-commerce-appuct-segmentation-appql-zwpmgsadjq5uqwmfszkbi8.streamlit.app/)
  
- **Preview (Dashbaor)**:  
  ![dashboard_instructions](https://github.com/user-attachments/assets/a44f0810-eaaf-4a08-9ba5-4cf98bf0251d)

- **🎥 Screencast Video**: [Click here to watch the full walkthrough](https://your-screencast-link.com)

---

## Project Overview

This project transforms raw transactional data into **actionable marketing insights**, starting with a clustering analysis of product performance.

Key phases:
-  Structured relational schema in PostgreSQL  
- Feature engineering using Python & SQL  
- Clustering via PCA + KMeans for segmentation  
- Streamlit dashboard for business decision-making

---

## 🧠 Product Segments Identified

| Segment             | Strategic Action                                 |
|---------------------|--------------------------------------------------|
| **Top Sellers**         | Optimize logistics and inventory                 |
| **Reliable Performers** | Promote visibility and maintain quality          |
| **Niche Favorites**     | Target loyal users with tailored promotions      |
| **Underperformers**     | Investigate pricing, delivery, or product quality|

---

## 🧱 System Architecture

| Component             | Technology                            |
|-----------------------|----------------------------------------|
| **Database**          | PostgreSQL (Dockerized)                |
| **Data Modeling**     | QuickDB (ERD)                          |
| **ETL & Analysis**    | Python, Pandas, SQLAlchemy, Scikit-learn |
| **Clustering & PCA**  | scikit-learn                           |
| **Dashboard**         | Streamlit + Plotly                     |
| **Deployment**        | Streamlit Cloud                        |

---

## 🗂️ Database Schema (ERD)

The schema models key business processes—orders, customers, sellers, reviews, and products—and was implemented in PostgreSQL.

![QuickDBD-Olist E-commerce Database Schema](https://github.com/user-attachments/assets/7d13de68-b3b2-4cac-8bce-52a4219ce52f)



---

## 📌 Features

- ✅ Normalized multi-table database with referential integrity  
- ✅ KPI aggregation: sales volume, revenue, review scores, delivery delays  
- ✅ Dimensionality reduction via PCA  
- ✅ Clustering with K-Means to generate product segments  
- ✅ Streamlit dashboard for interactive exploration and CSV export  
- ✅ Docker-ready for reproducibility

---

## 🔮 Future Enhancements

The current product performance segmentation sets the foundation for advanced marketing analytics features:

- 📈 Customer Lifetime Value (LTV / CLV) modeling  
- 🔄 Churn prediction  
- 💰 Customer Acquisition Cost (CAC) estimation  
- 🧪 A/B Testing framework  
- 🧾 Sentiment analysis (reviews)  
- 📊 Revenue forecasting using SARIMA, Prophet, or LSTM  
- 📦 Inventory optimization based on sales velocity

---

## ⚙️ Setup Instructions

### 1. Clone the repository

```bash
git clone https://github.com/yourusername/olist-marketing-analytics.git
cd olist-marketing-analytics
