SELECT customer_name, sale_date, sale_amount,
       AVG(sale_amount) OVER (
         PARTITION BY customer_id ORDER BY sale_date
         ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS moving_avg
FROM Sales
JOIN Customers ON Sales.customer_id = Customers.customer_id;
