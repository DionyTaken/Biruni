-- Müşteriler tablosu
CREATE TABLE Customers (
    customer_id UNIQUEIDENTIFIER PRIMARY KEY,
    customer_name NVARCHAR(100),
    email NVARCHAR(100)
);

-- Satışlar tablosu
CREATE TABLE Sales (
    sale_id UNIQUEIDENTIFIER PRIMARY KEY,
    customer_id UNIQUEIDENTIFIER,
    sale_amount DECIMAL(10, 2),
    sale_date DATETIME,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Örnek müşteri verisi ekleme
INSERT INTO Customers (customer_id, customer_name, email)
VALUES 
    (NEWID(), 'Ahmet Yılmaz', 'ahmet@xyz.com'),
    (NEWID(), 'Mehmet Korkmaz', 'mehmet@xyz.com'),
    (NEWID(), 'Ayşe Demir', 'ayse@xyz.com');

-- Örnek satış verisi ekleme
INSERT INTO Sales (sale_id, customer_id, sale_amount, sale_date)
VALUES
    (NEWID(), (SELECT customer_id FROM Customers WHERE customer_name = 'Ahmet Yılmaz'), 100.50, '2025-04-01'),
    (NEWID(), (SELECT customer_id FROM Customers WHERE customer_name = 'Mehmet Korkmaz'), 200.75, '2025-04-02'),
    (NEWID(), (SELECT customer_id FROM Customers WHERE customer_name = 'Ayşe Demir'), 150.25, '2025-04-03'),
    (NEWID(), (SELECT customer_id FROM Customers WHERE customer_name = 'Ahmet Yılmaz'), 180.00, '2025-04-04'),
    (NEWID(), (SELECT customer_id FROM Customers WHERE customer_name = 'Mehmet Korkmaz'), 90.00, '2025-04-05'),
    (NEWID(), (SELECT customer_id FROM Customers WHERE customer_name = 'Ahmet Yılmaz'), 250.00, '2025-04-06'),
    (NEWID(), (SELECT customer_id FROM Customers WHERE customer_name = 'Mehmet Korkmaz'), 120.00, '2025-04-07'),
    (NEWID(), (SELECT customer_id FROM Customers WHERE customer_name = 'Ayşe Demir'), 300.00, '2025-04-08'),
    (NEWID(), (SELECT customer_id FROM Customers WHERE customer_name = 'Ahmet Yılmaz'), 180.50, '2025-04-09'),
    (NEWID(), (SELECT customer_id FROM Customers WHERE customer_name = 'Mehmet Korkmaz'), 220.00, '2025-04-10'),
    (NEWID(), (SELECT customer_id FROM Customers WHERE customer_name = 'Ayşe Demir'), 180.00, '2025-04-05'),
    (NEWID(), (SELECT customer_id FROM Customers WHERE customer_name = 'Ahmet Yılmaz'), 180.00, '2025-04-02'),
    (NEWID(), (SELECT customer_id FROM Customers WHERE customer_name = 'Ayşe Demir'), 1000.00, '2025-04-11'),
    (NEWID(), (SELECT customer_id FROM Customers WHERE customer_name = 'Ahmet Yılmaz'), 1500.00, '2025-04-12');
