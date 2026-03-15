📊 Case Study: E-Commerce Payment and Delivery Analytics
📌 Project Overview

This project analyzes payment behavior, delivery performance, and customer satisfaction for a large e-commerce platform operating across multiple product categories such as electronics, fashion, beauty, and pet supplies.

The objective is to extract meaningful insights from order, payment, delivery, and review data to help the company improve:

Customer experience

Delivery efficiency

Payment optimization

Marketing strategies

The analysis focuses on key business KPIs that reveal patterns in payment usage, delivery timelines, and customer feedback.

🗂 Dataset Description

The dataset contains multiple tables related to e-commerce operations, including:

Orders Dataset – Order purchase time and delivery information

Customers Dataset – Customer location details
   
Order Payments Dataset – Payment type and payment value

Order Reviews Dataset – Customer review scores (1–5)

Products Dataset – Product categories

Order Items Dataset – Product price and order details

These datasets are joined together to perform business analysis.

🛠 Tools & Technologies Used

SQL / MySQL / PostgreSQL – Data querying and KPI calculations

Excel / Google Sheets – Data exploration and validation

Power BI – Data visualization and dashboards

GitHub – Project documentation and version control

📈 Key Performance Indicators (KPIs)
KPI 1: Weekday vs Weekend Payment Statistics
Objective

Analyze payment behavior differences between weekday and weekend orders.

Steps

Classify orders as weekday or weekend using order_purchase_timestamp

Calculate:

Total payments

Average payment value

Payment method distribution (credit card, debit card, etc.)

Compare payment preferences across weekdays and weekends

Expected Insight

Identify whether customers prefer certain payment methods on weekends, which could help optimize promotions and payment gateway strategies.

KPI 2: Orders with Review Score 5 and Credit Card Payment
Objective

Measure the number of highly satisfied customers who used credit cards.

Steps

Filter orders with:

review_score = 5

payment_type = 'credit_card'

Count the number of such orders

Expected Insight

Understand whether credit card payments are commonly used by highly satisfied customers, which may guide loyalty programs or targeted offers.

KPI 3: Average Delivery Time for Pet Shop Products
Objective

Evaluate delivery efficiency for the pet_shop product category.

Steps

Filter products where product_category = 'pet_shop'

Calculate delivery time:

delivery_time = order_delivered_customer_date - order_purchase_timestamp

Compute the average delivery time

Expected Insight

Identify whether pet shop products experience delivery delays and determine potential logistics improvements.

KPI 4: Average Order Price and Payment Amount for São Paulo Customers
Objective

Analyze purchasing behavior of customers located in São Paulo, one of the company's largest markets.

Steps

Filter customers where customer_city = 'São Paulo'

Calculate:

Average order price (product_price)

Average payment value (payment_value)

Expected Insight

Understand spending patterns of São Paulo customers to help optimize regional marketing strategies and inventory planning.

KPI 5: Relationship Between Shipping Days and Review Scores
Objective

Analyze whether faster deliveries lead to higher customer satisfaction.

Steps

Calculate shipping time:

shipping_days = order_delivered_customer_date - order_purchase_timestamp

Group data by review_score

Calculate average shipping days per review score

Expected Insight

Identify if shorter delivery times correlate with higher review scores, helping the company prioritize delivery improvements.

📊 Business Impact

The insights from this analysis can help the company:

Improve delivery performance

Optimize payment strategies

Enhance customer satisfaction

Design data-driven marketing campaigns

🚀 Future Improvements

Build Power BI dashboards for visual analysis

Perform customer segmentation analysis

Implement predictive models for delivery delays

Analyze seasonal purchasing trends

👨‍💻 Author

  Ashwini 
Aspiring Data Analyst | SQL | Power BI | Data Visualization
