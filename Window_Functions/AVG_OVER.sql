SELECT Customers.customer_name, Sales.sale_amount,
       AVG(Sales.sale_amount) OVER (PARTITION BY Customers.customer_name) AS avg_sale,
       CASE WHEN Sales.sale_amount > AVG(Sales.sale_amount) OVER (PARTITION BY Customers.customer_name)
            THEN 'Üstünde' ELSE 'Altında' END AS durum
FROM Sales
JOIN Customers ON Sales.customer_id = Customers.customer_id;
