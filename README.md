# Ecommerce-Olist_Store-Analysis
Case Study: E-Commerce Payment and Delivery Analytics
________________________________________
Background:
You are working as a data analyst for a large e-commerce company that operates across various product categories, including electronics, fashion, beauty, pet supplies, and more. The company receives millions of orders each year and relies on various forms of payments such as credit cards, debit cards, bank transfers, and digital wallets. Customers provide feedback through reviews, which range from 1 to 5 stars, and these reviews are linked to specific orders. Additionally, products are delivered by different carriers, with delivery times varying across regions.
Your task is to perform an in-depth analysis of payment statistics, delivery performance, and customer satisfaction to help improve operational efficiency, customer experience, and marketing strategies.
________________________________________
Objectives:
The case study consists of several key performance indicators (KPIs) that will guide your analysis. These KPIs will help you understand customer behavior, evaluate delivery efficiency, and explore the impact of different variables on customer satisfaction.
KPI 1: Weekday vs Weekend Payment Statistics
Task: Analyze the payment statistics by separating orders made on weekdays from those made on weekends. Determine if there are any notable differences in payment behavior between these two groups.
•	Steps:
1.	Classify orders as weekday or weekend based on the order_purchase_timestamp.
2.	Calculate payment statistics such as total payments, average payment value, and the breakdown of payment types (credit card, debit card, etc.) for both weekdays and weekends.
3.	Identify any significant differences in payment behavior (e.g., is there a higher preference for credit card payments on weekends?).
Expected Outcome: Insights into how payment methods vary between weekdays and weekends, which could influence promotional campaigns or payment system optimizations.
________________________________________
KPI 2: Count of Orders with Review Score 5 and Payment Type as Credit Card
Task: Determine how many orders received a review score of 5 (the highest rating) and were paid using a credit card. This helps assess customer satisfaction and payment method preferences.
•	Steps:
1.	Filter the dataset to find orders with a review score of 5 and a payment type of "credit card."
2.	Count the total number of such orders.
3.	Investigate the correlation between payment method and satisfaction levels.
Expected Outcome: Understanding of how many satisfied customers (rating 5) prefer to use credit cards, which could help tailor marketing and loyalty programs.
________________________________________
KPI 3: Average Delivery Time for Pet Shop Products
Task: Calculate the average number of days it takes to deliver orders from the "pet_shop" category to customers. This analysis helps assess delivery efficiency for this category.
•	Steps:
1.	Filter orders that belong to the "pet_shop" category.
2.	Calculate the difference between the order_delivered_customer_date and order_purchase_timestamp for each order.
3.	Calculate the average delivery time across all "pet_shop" orders.
Expected Outcome: Insights into the delivery efficiency of the "pet_shop" category, which can be used to improve customer satisfaction and identify potential logistical bottlenecks.
________________________________________
KPI 4: Average Order Price and Payment Amount for Customers in São Paulo
Task: Calculate the average order price and the average payment amount for customers located in São Paulo. This analysis will help understand the purchasing behavior of customers in one of the company's key markets.
•	Steps:
1.	Filter the dataset for customers located in São Paulo.
2.	Calculate the average order price (product_price) and average payment value (payment_value) for these customers.
3.	Compare the results to customers from other regions (optional).
Expected Outcome: A deeper understanding of the spending behavior of São Paulo customers, which could inform regional marketing strategies, pricing decisions, and stock allocation.
________________________________________
KPI 5: Relationship Between Shipping Days and Review Scores
Task: Analyze the relationship between the number of shipping days (time taken for delivery) and the review scores given by customers. Does faster delivery correlate with higher customer satisfaction?
•	Steps:
1.	Calculate the number of shipping days for each order by subtracting the order_purchase_timestamp from the order_delivered_customer_date.
2.	Group the data by review score and calculate the average number of shipping days for each score (1 to 5).
3.	Analyze whether shorter delivery times lead to higher review scores, and identify any trends.
Expected Outcome: Insights into whether delivery speed affects customer satisfaction, and how companies can optimize their delivery strategies to improve reviews.

Data Dictionaries

