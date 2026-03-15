CREATE DATABASE Olist_store_analysis;
create table olist_customers_dataset (customer_id	text,
customer_unique_id	text,
customer_zip_code_prefix	int,
customer_city	text,
customer_state text);
SET GLOBAL local_infile = 1;
LOAD DATA LOCAL INFILE 'C:\\Users\\jayam\\OneDrive\\Documents\\ExcelR Project E commerce\\E commerce\\olist_customers_dataset.csv'
INTO TABLE olist_customers_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
select * from olist_customers_dataset;

create table olist_geolocation_dataset(geolocation_zip_code_prefix	int,
geolocation_lat	float,
geolocation_lng	float,
geolocation_city text,
geolocation_state text);

LOAD DATA LOCAL INFILE 'C:/Users/jayam/OneDrive/Documents/ExcelR Project E commerce/E commerce/olist_geolocation_dataset.csv'
INTO TABLE olist_geolocation_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


create table olist_order_items_dataset(order_id	text,
order_item_id	int,
product_id	text,
seller_id	text,
shipping_limit_date	datetime,
price	float,
freight_value float
);

LOAD DATA LOCAL INFILE 'C:/Users/jayam/OneDrive/Documents/ExcelR Project E commerce/E commerce/olist_order_items_dataset.csv'
INTO TABLE olist_order_items_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


create table olist_order_payments_dataset(
order_id	text,
payment_sequential	int,
payment_type	text,
payment_installments	int,
payment_value float);

LOAD DATA LOCAL INFILE 'C:/Users/jayam/OneDrive/Documents/ExcelR Project E commerce/E commerce/olist_order_payments_dataset.csv'
INTO TABLE olist_order_payments_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


create table olist_order_reviews_dataset(review_id	text,
order_id	text,
review_score	int,
review_comment_title	text,
review_comment_message	text,
review_creation_date	datetime,
review_answer_timestamp datetime);


LOAD DATA LOCAL INFILE 'C:/Users/jayam/OneDrive/Documents/ExcelR Project E commerce/E commerce/olist_order_reviews_dataset.csv'
INTO TABLE olist_order_reviews_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n' -- Changed from '\n' to '\r\n'
IGNORE 1 LINES;


create table olist_products_dataset(product_id	text,
product_category_name	text,
product_name_lenght	int,
product_description_lenght	int,
product_photos_qty	int,
product_weight_g	int,
product_length_cm	int,
product_height_cm	int,
product_width_cm int);


LOAD DATA LOCAL INFILE 'C:/Users/jayam/OneDrive/Documents/ExcelR Project E commerce/E commerce/olist_products_dataset.csv'
INTO TABLE olist_products_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


create table olist_sellers_dataset(
seller_id	text,
seller_zip_code_prefix	int,
seller_city	text,
seller_state text);

LOAD DATA LOCAL INFILE 'C:/Users/jayam/OneDrive/Documents/ExcelR Project E commerce/E commerce/olist_sellers_dataset.csv'
INTO TABLE olist_sellers_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


create table olist_orders_dataset (order_id	text,
customer_id	text,
order_status	text,
order_purchase_timestamp	datetime,
order_approved_at	datetime,
order_delivered_carrier_date	datetime,
order_delivered_customer_date	datetime,
order_estimated_delivery_date datetime);


LOAD DATA LOCAL INFILE 'C:/Users/jayam/OneDrive/Documents/ExcelR Project E commerce/E commerce/olist_orders_dataset.csv'
INTO TABLE olist_orders_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

 
create table product_category_name_translation(product_category_name	text,
product_category_name_english text);

LOAD DATA LOCAL INFILE 'C:/Users/jayam/OneDrive/Documents/ExcelR Project E commerce/E commerce/product_category_name_translation.csv'
INTO TABLE product_category_name_translation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

# kpi 1: Weekday Vs Weekend (order_purchase_timestamp) Payment Statistics
SELECT 
kpi1.day_end,
CONCAT(ROUND(kpi1.total_payments / 
(SELECT SUM(payment_value) FROM olist_order_payments_dataset) * 100, 2), '%') 
AS percentage_values
FROM 
(
SELECT 
ord.day_end,
SUM(pmt.payment_value) AS total_payments
FROM olist_order_payments_dataset AS pmt JOIN
    (
SELECT DISTINCT order_id,
CASE
WHEN WEEKDAY(order_purchase_timestamp) IN (5,6) THEN 'weekend'
ELSE 'weekday'
END AS day_end
FROM olist_orders_dataset
) AS ord
ON ord.order_id = pmt.order_id
GROUP BY ord.day_end
) AS kpi1;

# kpi 2: Number of Orders with review score 5 and payment type as credit card.

SELECT COUNT(DISTINCT p.order_id) AS total_orders
FROM olist_order_payments_dataset p
JOIN olist_order_reviews_dataset r
ON p.order_id = r.order_id
WHERE r.review_score = 5
AND p.payment_type = 'credit_card';

# kpi 3 : Average number of days taken for order_delivered_customer_date for pet_shop

SELECT 
p.product_category_name,
ROUND(AVG(DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp)), 2) 
AS avg_delivery_days
FROM olist_orders_dataset o
JOIN olist_order_items_dataset oi 
ON o.order_id = oi.order_id
JOIN olist_products_dataset p 
ON oi.product_id = p.product_id
WHERE p.product_category_name = 'pet_shop'
AND o.order_delivered_customer_date IS NOT NULL;

# kpi 4: Average price and payment values from customers of sao paulo city

SELECT 
ROUND(AVG(oi.price), 2) AS avg_price,
ROUND(AVG(p.payment_value), 2) AS avg_payment
FROM olist_customers_dataset c
JOIN olist_orders_dataset o 
ON c.customer_id = o.customer_id
JOIN olist_order_items_dataset oi 
ON o.order_id = oi.order_id
JOIN olist_order_payments_dataset p 
ON o.order_id = p.order_id
WHERE LOWER(c.customer_city) = 'sao paulo';

# kpi 5 : Relationship between shipping days (order_delivered_customer_date - order_purchase_timestamp) Vs review scores.

SELECT 
r.review_score,
ROUND(AVG(DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp)), 2) 
AS avg_shipping_days
FROM olist_orders_dataset o
JOIN olist_order_reviews_dataset r
ON o.order_id = r.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY r.review_score
ORDER BY r.review_score;




