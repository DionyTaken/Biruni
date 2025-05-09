CREATE PROCEDURE CheckProductStock
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
        THROW 50001, 'Ürün bulunamadı.', 1;
    END

    IF @Stock <= 0
    BEGIN
        THROW 50002, 'Yeterli stok yok.', 1;
    END

    IF @Stock < @Quantity
    BEGIN
        THROW 50002, 'Yeterli stok yok.', 1;
    END

    SELECT 'Stok yeterli.' AS Result;
END;
