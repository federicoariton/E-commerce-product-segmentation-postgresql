import streamlit as st
import pandas as pd
import plotly.express as px
import os


df = pd.read_csv(os.path.join(os.path.dirname(__file__), "product_segmentation.csv"))


# Title
st.title("Product Segmentation Dashboard")

# Sidebar
segment = st.sidebar.selectbox("📂 Select Segment", sorted(df['cluster_label'].unique()))

# Filtered segment data
filtered = df[df['cluster_label'] == segment]

# Display segment strategy
st.sidebar.markdown("📌 **Segment Strategy Tips**")
strategy_map = {
    "Top Sellers": "Maximize visibility, stock inventory, and optimize logistics.",
    "Reliable Performers": "Keep stable promotion and maintain quality to grow.",
    "Niche Favorites": "Target loyal customers with specific campaigns.",
    "Underperformers": "Analyze pain points – improve reviews, delivery, or pricing."
}
st.sidebar.info(strategy_map.get(segment, "No strategy available."))

# KPIs
st.markdown("### 📌 Key Metrics")
col1, col2, col3, col4 = st.columns(4)
col1.metric("📦 Avg Sales", f"{filtered['total_sales_volume'].mean():,.0f}")
col2.metric("💰 Avg Revenue", f"{filtered['total_revenue'].mean():,.0f}")
col3.metric("⭐ Avg Review", f"{filtered['avg_review_score'].mean():.2f}")
col4.metric("⏱️ Avg Delay", f"{filtered['avg_delivery_delay'].mean():.2f} days")

# Bar Chart
st.markdown("### 🏆 Top 10 Product Categories by Sales Volume")
top10 = filtered.nlargest(10, 'total_sales_volume')
fig_bar = px.bar(top10, x='product_category_name', y='total_sales_volume',
                 labels={'total_sales_volume': 'Sales Volume', 'product_category_name': 'Category'},
                 template='plotly_white')
st.plotly_chart(fig_bar, use_container_width=True)

# PCA Scatter Plot
if 'PCA1' in df.columns and 'PCA2' in df.columns:
    st.markdown("### 🧬 PCA Scatter Plot of Clusters")
    fig_pca = px.scatter(df, x='PCA1', y='PCA2', color='cluster_label',
                         hover_data=['product_category_name'],
                         title='Cluster Distribution by PCA',
                         template='plotly_white')
    st.plotly_chart(fig_pca, use_container_width=True)

# Segment Table
st.markdown("### 📋 Segment Table")
st.dataframe(filtered[['product_category_name', 'total_sales_volume', 'total_revenue', 'avg_review_score', 'avg_delivery_delay']])

# Cluster Summary Table
st.markdown("### 📑 Cluster Summary Table")
summary = df.groupby('cluster_label')[['total_sales_volume', 'total_revenue', 'avg_review_score', 'avg_delivery_delay']].mean().round(2).reset_index()
st.dataframe(summary)

# Export option
st.markdown("### 💾 Export Current Segment")
csv = filtered.to_csv(index=False).encode('utf-8')
st.download_button(label="Download Segment as CSV", data=csv, file_name=f"{segment}_segment.csv", mime='text/csv')
