# 🛍️ Olist E-commerce Marketing Analytics Dashboard

An end-to-end marketing analytics project focused on **product performance segmentation** using real-world e-commerce data from [Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce). The project demonstrates full-stack data science capabilities, from relational database modeling and feature engineering to clustering, dashboard development, and business strategy.

🚀 **Live Dashboard**: [Click here to interact with the Streamlit app]([https://your-dashboard-link.streamlit.app](https://e-commerce-appuct-segmentation-appql-zwpmgsadjq5uqwmfszkbi8.streamlit.app/))  
🎥 **Demo Video**: [Watch here](https://your-video-link.com)

---

## Project Overview

This solution transforms raw transactional data into **actionable insights** via:
- A normalized PostgreSQL database (schema modeled with QuickDB)
- Feature engineering with Python (pandas, SQLAlchemy)
- Dimensionality reduction and product segmentation via PCA + KMeans
- Interactive dashboard for strategic business use

The core goal is to segment product categories based on performance (sales, reviews, delivery) and guide **data-driven decision-making**.

---

## 🧱 Tech Stack

| Layer                 | Tool / Library                       |
|----------------------|--------------------------------------|
| **Database**         | PostgreSQL (Docker)                  |
| **Modeling**         | QuickDB (ERD)                        |
| **Backend**          | Python, Pandas, Scikit-learn         |
| **Visualization**    | Plotly, PCA                          |
| **Frontend**         | Streamlit                            |
| **Deployment**       | Streamlit Cloud                      |

---

## 📌 Features

-  Structured e-commerce dataset modeled in PostgreSQL
-  Aggregated KPIs: revenue, sales, reviews, delivery time
-  Clustering: PCA + K-Means to segment product performance
- Interactive dashboard:
  - Cluster explorer
  - KPI viewer
  - CSV export
-  Dockerized environment for reproducibility

---

## 🧠 Product Segments Identified

| Segment            | Strategic Action                                 |
|--------------------|--------------------------------------------------|
| Top Sellers        | Optimize logistics and inventory                 |
| Reliable Performers| Promote visibility and maintain quality          |
| Niche Favorites    | Target loyal users with promotions               |
| Underperformers    | Investigate pricing, delivery, or product issues |

---

## 🔮 Future Enhancements

Planned expansions to evolve this into a **comprehensive marketing intelligence platform**:

- 📈 LTV/CLV modeling
- 🔄 Churn prediction
- 💰 CAC analysis
- 🧪 A/B testing framework
- 🧑‍🤝‍🧑 Customer personas
- 📦 Inventory optimization
- 🧾 Sentiment analysis (reviews)
- 📊 Revenue forecasting (SARIMA, Prophet, LSTM)

---

## ⚙️ Setup Instructions

### 1. Clone the repository

```bash
git clone https://github.com/yourusername/olist-marketing-analytics.git
cd olist-marketing-analytics
