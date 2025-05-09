SELECT Customers.customer_name, Sales.sale_amount,
       NTILE(4) OVER (ORDER BY Sales.sale_amount DESC) AS quartile
FROM Sales
JOIN Customers ON Sales.customer_id = Customers.customer_id;
