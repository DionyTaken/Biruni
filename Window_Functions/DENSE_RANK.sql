SELECT Customers.customer_name, Sales.sale_amount,
       DENSE_RANK() OVER (ORDER BY Sales.sale_amount DESC) AS dense_rank
FROM Sales
JOIN Customers ON Sales.customer_id = Customers.customer_id;
