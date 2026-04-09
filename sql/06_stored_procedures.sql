/* Devuelve ingresos y ganancia para una región específica.*/
CREATE PROCEDURE sp_ventas_por_region
	@Region Varchar(50)
AS
BEGIN
	SELECT
		u.Region,
		SUM(dp.Sales) AS Ingresos,
        SUM(dp.Profit) AS Ganancia
    FROM ubicaciones u
    INNER JOIN pedidos p ON u.LocationID = p.LocationID
    INNER JOIN detalle_pedidos dp ON p.OrderID = dp.OrderID
    WHERE u.Region = @Region
    GROUP BY u.Region
END

/* Devuelve ingresos y ganancia por subcategoría para una categoría específica.*/
CREATE PROCEDURE sp_ventas_por_categoria 
    @Category VARCHAR(50)
AS
BEGIN
SELECT
    p.Category,
    p.SubCategory,
    SUM(dp.Sales) AS Ingresos,
    SUM(dp.Profit) AS Ganancia
FROM productos p
INNER JOIN detalle_pedidos dp ON p.ProductID = dp.ProductID
WHERE p.Category = @Category
GROUP BY p.Category, p.SubCategory 
END

/* Devuelve la evolución de ventas mes a mes entre dos fechas.*/
CREATE PROCEDURE sp_ventas_por_periodo
    @FechaInicio DATE,
    @FechaFin DATE
AS
BEGIN
    SELECT
        YEAR(p.OrderDate) AS Año,
        MONTH(p.OrderDate) AS Mes,
        SUM(dp.Sales) AS Ingresos,
        SUM(dp.Profit) AS Ganancia
    FROM pedidos p
    INNER JOIN detalle_pedidos dp ON p.OrderID = dp.OrderID
    WHERE p.OrderDate BETWEEN @FechaInicio AND @FechaFin
    GROUP BY YEAR(p.OrderDate), MONTH(p.OrderDate)
    ORDER BY Año, Mes
END

/* Devuelve los N productos más vendidos por ingresos.*/
CREATE PROCEDURE sp_top_productos
    @Top INT
AS
BEGIN
    SELECT TOP (@Top)
        p.ProductName,
        p.Category,
        p.SubCategory,
        SUM(dp.Sales) AS Ingresos,
        SUM(dp.Profit) AS Ganancia
    FROM productos p
    INNER JOIN detalle_pedidos dp ON p.ProductID = dp.ProductID
    GROUP BY p.ProductName, p.Category, p.SubCategory
    ORDER BY Ingresos DESC
END

/* Devuelve las ciudades con resultado negativo para una región específica.*/
CREATE PROCEDURE sp_ciudades_con_perdidas
    @Region VARCHAR(50)
AS
BEGIN
    SELECT
        u.City,
        u.Region,
        SUM(dp.Sales) AS Ventas,
        SUM(dp.Profit) AS Resultado
    FROM ubicaciones u
    INNER JOIN pedidos p ON u.LocationID = p.LocationID
    INNER JOIN detalle_pedidos dp ON p.OrderID = dp.OrderID
    WHERE u.Region = @Region
    GROUP BY u.City, u.Region
    HAVING SUM(dp.Profit) < 0
    ORDER BY Ventas DESC
END