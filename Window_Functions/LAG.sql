SELECT Customers.customer_name, Sales.sale_date, Sales.sale_amount,
       LAG(Sales.sale_amount) OVER (PARTITION BY Customers.customer_name ORDER BY Sales.sale_date) AS previous_sale
FROM Sales
JOIN Customers ON Sales.customer_id = Customers.customer_id;
