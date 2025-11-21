### Project Overview
A **realistic Zomato/Swiggy-like food delivery dataset** with 5 interconnected tables.  
Built from scratch with proper **Primary Keys, Foreign Keys, realistic data, and 15+ powerful EDA queries**.

Perfect for:
- SQL Portfolio Projects
- Data Analyst Interviews
- Learning Advanced PostgreSQL
- Business Intelligence Practice

---

### Database Schema (practice_zomato_db)

```sql
customers     → customer_id (PK), customer_name, reg_date
restaurants   → restaurant_id (PK), restaurant_name, city, opening_hours
orders        → order_id (PK), customer_id, restaurant_id, order_item, 
                order_date, order_status, total_amount
riders        → rider_id (PK), rider_name, sign_up
deliveries    → delivery_id (PK), order_id → orders, rider_id → riders,
                delivery_status, delivery_time (TIME)


### 15 Key Business Insights (All from Your Data)

| #  | Insight                                      | Highlight from Results                              |
|----|-----------------------------------------------|-----------------------------------------------------|
| 1  | Monthly Revenue Trend & AOV                   | Revenue growing month-over-month                    |
| 2  | Top Revenue Restaurants                       | Barbeque Nation #1 despite only 2 orders            |
| 3  | Most Ordered Restaurants                      | Punjabi Tadka & fast-food chains lead               |
| 4  | City Performance                              | Delhi dominates both orders & revenue               |
| 5  | Customer Lifetime Value (Top 10)              | One customer spent ₹3,198                           |
| 6  | Repeat Customer Rate                          | **43.33%** — strong retention signal              |
| 7  | Rider Performance Leaderboard                 | Rider #501 (Vikram) = most active & reliable       |
| 8  | Delivery Speed by City                        | Bangalore wins (avg 28.5 min)                       |
| 9  | Cuisine Popularity                            | Biryani > Pizza > Burger > South Indian             |
| 10 | Peak Day Analysis                             | Friday–Sunday = 55%+ of weekly orders               |
| 11 | Premium vs Budget Segmentation                | 33% orders above ₹800 (premium tier exists)         |
| 12 | Fastest Deliveries                            | 22-minute record (waffle order)                     |
| 13 | Activation Speed                              | Most users order within 1 week of signup             |
| 14 | Rider Utilization                              | 26/30 riders active → **86.67%** utilization        |
| 15 | Pareto 80/20 Rule                             | Top 20% customers drive ~78% revenue → Classic!     |

All queries are in `02_eda_queries.sql` — ready to run and impress!
