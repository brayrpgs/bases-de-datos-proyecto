USE [proyecto]
GO
/****** Object:  StoredProcedure [dbo].[InsertProductsOrdered]    Script Date: 16/06/2024 23:33:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- INSERTAR EN LA TABLA PRODUCTS_ORDERED (relacion 1 a n, un pedido n productos)
ALTER PROCEDURE [dbo].[InsertProductsOrdered]
    @Orders_id INT, -- ID del pedido recién creado
    @ProductIds NVARCHAR(MAX), -- Lista de IDs de productos separados por comas
    @Quantities NVARCHAR(MAX), -- Lista de cantidades correspondientes a cada producto, separados por comas
    @ProductsOrdered_id INT OUTPUT -- ID de la relación de productos ordenados que se devolverá
AS
BEGIN
    SET NOCOUNT ON; -- Evita que se devuelvan mensajes de cuenta de filas afectadas
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Orders WHERE Orders_id = @Orders_id)
        BEGIN
            RAISERROR('El pedido con Id %d no existe.', 16, 1, @Orders_id);
            RETURN;
        END
    
        DECLARE @ProductId INT; -- Variable para almacenar temporalmente cada ID de producto
        DECLARE @Quantity INT; -- Variable para almacenar temporalmente cada cantidad de producto
        DECLARE @Index INT = 1; -- Índice inicial para el bucle
        DECLARE @ProductIdList TABLE (ProductId INT, Quantity INT); -- Tabla temporal para almacenar los IDs de productos y sus cantidades

        -- Divide la cadena de IDs de productos y cantidades en una tabla
        WHILE LEN(@ProductIds) > 0 AND LEN(@Quantities) > 0
        BEGIN
            -- Extrae el primer ID de producto de la cadena
            SET @ProductId = CAST(SUBSTRING(@ProductIds, 1, CHARINDEX(',', @ProductIds + ',') - 1) AS INT);
            -- Extrae la primera cantidad de la cadena
            SET @Quantity = CAST(SUBSTRING(@Quantities, 1, CHARINDEX(',', @Quantities + ',') - 1) AS INT);
 
            IF NOT EXISTS (SELECT 1 FROM PRODUCT WHERE ID_PRODUCT = @ProductId)
            BEGIN
                RAISERROR('El producto con Id %d no existe.', 16, 1, @ProductId);
                RETURN;
            END
            
            -- Inserta el ID de producto y la cantidad en la tabla temporal
            INSERT INTO @ProductIdList (ProductId, Quantity) VALUES (@ProductId, @Quantity);
            -- Elimina el ID de producto y la cantidad procesados de las cadenas
            SET @ProductIds = STUFF(@ProductIds, 1, CHARINDEX(',', @ProductIds + ','), '');
            SET @Quantities = STUFF(@Quantities, 1, CHARINDEX(',', @Quantities + ','), '');
        END

        -- Inserta cada producto en la tabla ProductsOrdered
        INSERT INTO ProductsOrdered (Orders_id, ID_PRODUCT, Cantidad)
        SELECT @Orders_id, ProductId, Quantity FROM @ProductIdList;

        -- Obtiene el último ID de ProductsOrdered insertado
        SELECT TOP 1 @ProductsOrdered_id = ProductsOrdered_id FROM ProductsOrdered WHERE Orders_id = @Orders_id ORDER BY ProductsOrdered_id DESC;
    END TRY
    BEGIN CATCH
        SET @ProductsOrdered_id = 0; -- Establece el valor de salida a 0 en caso de error
        THROW; -- Re-lanza la excepción para que sea capturada por la transacción externa
    END CATCH
END
