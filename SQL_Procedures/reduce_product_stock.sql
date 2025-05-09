CREATE PROCEDURE ReduceProductStock
    @ProductId UNIQUEIDENTIFIER,
    @Quantity INT
AS
BEGIN
    DECLARE @Stock INT;

    SELECT @Stock = stock
    FROM products
    WHERE id = @ProductId;

    IF @Stock IS NULL
    BEGIN
        THROW 50004, 'Ürün bulunamadı.', 1;
    END

    IF @Stock < @Quantity
    BEGIN
        THROW 50005, 'Stok yetersiz, işlem iptal edildi.', 1;
    END

    UPDATE products
    SET stock = stock - @Quantity
    WHERE id = @ProductId;
END;
