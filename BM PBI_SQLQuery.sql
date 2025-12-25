-- Add Primary Key 
ALTER TABLE bm_pbi_finaltask.Customer
	ADD PRIMARY KEY (CustomerID) NOT ENFORCED;
ALTER TABLE bm_pbi_finaltask.Orders
	ADD PRIMARY KEY (OrderID) NOT ENFORCED;
ALTER TABLE bm_pbi_finaltask.ProductCategory
	ADD PRIMARY KEY (CategoryID) NOT ENFORCED;
ALTER TABLE bm_pbi_finaltask.Products
	ADD PRIMARY KEY (ProdNumber) NOT ENFORCED;

-- Create master table
SELECT Orders.Date as order_date, ProductCategory.CategoryName as category_name, Products.ProdName as product_name, Products.Price as product_price, Orders.Quantity as order_qty, (Products.Price * Orders.Quantity) as total_sales, Customer.CustomerEmail as cust_email, Customer.CustomerCity as cust_city  
	FROM Customer 
	JOIN Orders ON Customer.CustomerID = Orders.CustomerID
	JOIN Products ON Orders.ProdNumber = Products.ProdNumber
	JOIN ProductCategory ON Products.Category = ProductCategory.CategoryID ORDER BY order_date ASC, order_qty ASC;