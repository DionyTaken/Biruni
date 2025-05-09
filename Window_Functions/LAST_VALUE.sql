SELECT Customers.customer_name, Sales.sale_date, Sales.sale_amount,
       LAST_VALUE(Sales.sale_amount) OVER (
           PARTITION BY Customers.customer_name ORDER BY Sales.sale_date
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS last_sale
FROM Sales
JOIN Customers ON Sales.customer_id = Customers.customer_id;
