# Autohero Logistics Efficiency Analysis 🚗📊

**End-to-end data analytics project** | SQL • Tableau • Business Insights  
Analyzed 17 weeks of car logistics data across Germany, Spain, and Poland to identify bottlenecks and recommend operational improvements.

## 🎯 Business Problem
Autohero faced:
- 636,426 cars in backlog (avg. age 1,602 days!)
- Extremely low delivery-to-booking ratio (~0.01)
- Inconsistent workshop throughput
- Declining bookings in later weeks

## 🔧 Tech Stack
- **SQL** – Complex queries with CTEs, window functions, and weekly aggregation
- **Tableau** – Interactive dashboard with parameters and calculated fields
- **Excel** – Detailed KPI tables

## 📈 Key Insights
| Metric                    | Value         | Insight                                  |
|---------------------------|---------------|------------------------------------------|
| Total Bookings            | 232,113       | Peak in Week 9, sharp decline afterward  |
| Workshop Deliveries       | Only 2,010    | Severe bottleneck                        |
| Avg. Lead Time            | 22 → 1 day    | Great improvement in processing speed    |
| Delivery-to-Booking Ratio | Max 0.013     | < 1.3% of bookings reach workshop       |
| Backlog (Week 17)         | DE: 42k cars  | Germany needs urgent capacity expansion  |

## 🛠️ Dashboard Features
- Weekly trends for bookings & deliveries
- Average lead time bar chart
- Delivery-to-booking ratio (stacked)
- Geographical heatmap (DE, ES, PL)
- Tooltips and filters


## 📊 Recommendations Delivered
1. Expand workshop capacity in Germany (highest backlog)
2. Optimize internal workflows to improve delivery-to-booking ratio
3. Implement weekly KPI monitoring using this dashboard


## 🚀 How to Run
1. Open `tableau/Autohero_Logistics_Dashboard.twbx` in Tableau Desktop/Public
2. Run queries in `sql/queries.sql` on your database (schema in data/ folder)

## 📫 Connect
Mangati Sathish  
Data Analyst  
sathishmangati@gmail.com | +49 176 47660107 | [LinkedIn](your-link)

---
⭐ Star this repo if you found it useful!
