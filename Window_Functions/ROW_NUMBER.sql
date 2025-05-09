SELECT Customers.customer_name, Sales.sale_amount,
       ROW_NUMBER() OVER (ORDER BY Sales.sale_amount DESC) AS row_num
FROM Sales
JOIN Customers ON Sales.customer_id = Customers.customer_id;
