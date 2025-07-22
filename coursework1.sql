CREATE TABLE store( 
	store_id INT NOT NULL,
	store_location VARCHAR(255) NOT NULL,
	office_type VARCHAR(255) NOT NULL,
	PRIMARY KEY (store_id)
);



CREATE TABLE employee( 
	employee_id INT NOT NULL ,
	employee_name VARCHAR(50) NOT NULL,
	store_id INT NOT NULL,
	employee_type VARCHAR(50) NOT NULL,
	designation VARCHAR(50) NOT NULL,
	payrollper_hours_GBP DECIMAL NOT NULL,
	employee_address VARCHAR(50) NOT NULL,
	post_code VARCHAR(20) NOT NULL,
	phone_no VARCHAR(22) NOT NULL,
	PRIMARY KEY (employee_id),
	FOREIGN KEY (store_id) REFERENCES store(store_id)
);



CREATE TABLE customer( 
	customer_id INT NOT NULL,
	email_id VARCHAR(100) NOT NULL,
	password VARCHAR(100) NOT NULL,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	address VARCHAR(100) NOT NULL,
	post_code VARCHAR(22) NOT NULL,
	phone_no VARCHAR(22) NOT NULL,
	PRIMARY KEY (customer_id),
	UNIQUE (email_id)
);



CREATE TABLE product_category( 
	category_id INT NOT NULL ,
	category_type VARCHAR(100) NOT NULL,
	category_name VARCHAR(100) NOT NULL,
	PRIMARY KEY (category_id)
);

select * from product_category;

CREATE TABLE ingredient( 
	ingredient_id INT NOT NULL,
	ingredient_name VARCHAR(100) NOT NULL,
	PRIMARY KEY (ingredient_id)
);



CREATE TABLE product( 
	product_id INT NOT NULL,
	product_name VARCHAR(100) NOT NULL,
	ingredient_id INT NOT NULL,
	sku_tag VARCHAR(15) NOT NULL,
	category_id INT NOT NULL,
    lifestyle VARCHAR(100) NOT NULL,
	price DECIMAL NOT NULL,
	storage_instruction TEXT,
	manufacture_date DATE,
	expiry_date DATE,
	country VARCHAR(100) NOT NULL,
	PRIMARY KEY (product_id),
	FOREIGN KEY (ingredient_id) REFERENCES ingredient(ingredient_id),
	FOREIGN KEY (category_id) REFERENCES product_category(category_id),
	UNIQUE (sku_tag)
);



CREATE TABLE payment( 
	payment_id INT NOT NULL,
	order_id INT NOT NULL,
	paid_amount DECIMAL NOT NULL,
	payment_status VARCHAR(22) NOT NULL,
	PRIMARY KEY (payment_id),
	FOREIGN KEY (order_id) REFERENCES order_detail(order_id)
);

select * from payment;

CREATE TABLE order_detail( 
	order_id INT NOT NULL,
	customer_id INT NOT NULL,
	store_id INT NOT NULL,
	total_amount DECIMAL NOT NULL,
	date DATE,
	time TIME,
	PRIMARY KEY (order_id),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (store_id) REFERENCES store(store_id)
);



CREATE TABLE delivery( 
	delivery_id INT NOT NULL ,
	delivery_type VARCHAR(15) NOT NULL,
	order_id INT NOT NULL,
	customer_id INT NOT NULL,
	store_id INT NOT NULL,
	delivery_address VARCHAR(100) NOT NULL,
	post_code VARCHAR(22) NOT NULL,
	phone_no VARCHAR(15) NOT NULL,
	PRIMARY KEY (delivery_id),
	FOREIGN KEY (order_id) REFERENCES order_detail(order_id),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (store_id) REFERENCES store(store_id)
);


---T4

-----Goooood
--Find the top 5 customers who have spent the most money on orders in a specific store:
---- Basic stats on customer per store

SELECT 
	c.customer_id, 
	c.first_name, 
	c.last_name, 
	s.store_location, 
	CONCAT ('£',SUM(od.total_amount)) AS total_spent
FROM customer c
	JOIN order_detail od ON c.customer_id = od.customer_id
	JOIN store s ON od.store_id = s.store_id
WHERE s.store_location = 'Havant'
	GROUP BY c.customer_id, c.first_name, c.last_name, s.store_location
	ORDER BY total_spent DESC;


--Okay to be put in T4
---Monthly income generated per city/location
SELECT
    store_location,
    TO_CHAR(date, 'YYYY-MM') AS month,
    CONCAT ('£',SUM(total_amount)) AS monthly_income
FROM order_detail od
	INNER JOIN store s USING(store_id)
	WHERE date >= '2022-01-01' AND date < '2023-09-09' -- Replace with the desired month and year
GROUP BY store_location, month
ORDER BY store_location;


----
--To calculate the monthly income for a specific store based on the "store_id," you can use the following SQL query. This query will sum the total income for each month and year for the specified store:
----
SELECT
    EXTRACT(YEAR FROM od.date) AS year,
    EXTRACT(MONTH FROM od.date) AS month,
    SUM(od.total_amount) AS monthly_income
FROM
    order_detail od
WHERE
    od.store_id = 2 -- Replace 'your_store_id' with the specific store_id
GROUP BY
    EXTRACT(YEAR FROM od.date),
    EXTRACT(MONTH FROM od.date)
ORDER BY
    year,
    month;


---
---Find the product categories with the highest average product prices:
---
SELECT pc.category_type, AVG(p.price) AS avg_price
FROM product p
JOIN product_category pc ON p.category_id = pc.category_id
GROUP BY pc.category_type
ORDER BY avg_price DESC;



---Find the top stores with the highest total payroll expenses:
SELECT s.store_id, s.store_location,
 CONCAT ('£',SUM(e.payrollper_hours_GBP)) AS total_payroll
FROM store s
JOIN employee e ON s.store_id = e.store_id
GROUP BY s.store_id, s.store_location
ORDER BY total_payroll DESC;



---
---Find the most popular product categories based on the number of products in each category:
SELECT 
	pc.category_name, 
	COUNT(p.product_id) AS product_count
FROM product_category pc
	LEFT JOIN product p ON pc.category_id = p.category_id
GROUP BY pc.category_name
ORDER BY product_count DESC;

---Best okay to put T4
---Identify customers who have placed orders in multiple stores:
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
WHERE c.customer_id IN (
    SELECT DISTINCT customer_id
    FROM order_detail
    GROUP BY customer_id
    HAVING COUNT(DISTINCT store_id) > 1
);









