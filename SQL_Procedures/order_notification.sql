CREATE PROCEDURE AddOrderNotification
    @OrderId UNIQUEIDENTIFIER,
    @CustomerId UNIQUEIDENTIFIER
AS
BEGIN
    DECLARE @Message NVARCHAR(500);

    IF NOT EXISTS (SELECT 1 FROM orders WHERE id = @OrderId)
    BEGIN
        THROW 50006, 'Sipariş bulunamadı.', 1;
    END

    SET @Message = CONCAT('Sipariş oluşturuldu: ', CAST(@OrderId AS NVARCHAR(50)));

    INSERT INTO notifications (order_id, customer_id, message, created_at)
    VALUES (@OrderId, @CustomerId, @Message, GETDATE());
END;
