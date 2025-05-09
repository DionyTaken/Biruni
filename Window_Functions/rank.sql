SELECT Customers.customer_name, Sales.sale_amount,
       RANK() OVER (ORDER BY Sales.sale_amount DESC) AS rank_num
FROM Sales
JOIN Customers ON Sales.customer_id = Customers.customer_id;
