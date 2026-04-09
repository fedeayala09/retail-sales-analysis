/* Ventas y ganancia por producto.*/
CREATE VIEW vw_ventas_por_producto AS
SELECT
    p.ProductName,
    p.Category,
    p.SubCategory,
    SUM(dp.Sales) AS Ingresos,
    SUM(dp.Profit) AS Ganancia
FROM productos p
INNER JOIN detalle_pedidos dp ON p.ProductID = dp.ProductID
GROUP BY p.ProductName, p.Category, p.SubCategory

/* Ventas y ganancia agrupados por categoría y subcategoría. */
CREATE VIEW vw_ventas_por_categoria AS
SELECT
    p.Category,
    p.SubCategory,
    SUM(dp.Sales) AS Ingresos,
    SUM(dp.Profit) AS Ganancia
FROM productos p
INNER JOIN detalle_pedidos dp ON p.ProductID = dp.ProductID
GROUP BY p.Category, p.SubCategory 

/* Promedio de descuento y ganancia por producto para analizar 
   si los descuentos altos impactan negativamente en la ganancia. */
CREATE VIEW vw_impacto_descuento AS
SELECT
    p.ProductName,
    p.Category,
    p.SubCategory,
    AVG(dp.Discount) AS PromedioDescuento,
    AVG(dp.Profit / NULLIF(dp.Sales, 0)) AS PromedioMargen,
    COUNT(dp.RowID) AS CantidadVentas
FROM productos p
INNER JOIN detalle_pedidos dp 
    ON p.ProductID = dp.ProductID
GROUP BY p.ProductName, p.Category, p.SubCategory;


/* Ingresos y ganancia agrupados por región geográfica. */
CREATE VIEW vw_ventas_por_region AS
SELECT
    u.Region,
    SUM(dp.Sales) AS Ingresos,
    SUM(dp.Profit) AS Ganancia
FROM ubicaciones u
INNER JOIN pedidos p 
    ON u.LocationID = p.LocationID
INNER JOIN detalle_pedidos dp 
    ON p.OrderID = dp.OrderID
GROUP BY u.Region;

select * from vw_ventas_por_region
/* Ciudades que tuvieron ventas pero cerraron con resultado negativo. */
CREATE VIEW vw_ciudades_con_perdidas AS
SELECT
    u.City,
    u.Region,
    SUM(dp.Sales) AS Ventas,
    SUM(dp.Profit) AS Resultado
FROM ubicaciones u
INNER JOIN pedidos p 
    ON u.LocationID = p.LocationID
INNER JOIN detalle_pedidos dp 
    ON p.OrderID = dp.OrderID
GROUP BY u.City, u.Region
HAVING SUM(dp.Profit) < 0;

/* Ingresos y ganancia agrupados por segmento de cliente. */
CREATE VIEW vw_ventas_por_segmento AS
SELECT
    c.Segment,
    SUM(dp.Sales) AS Ingresos,
    SUM(dp.Profit) AS Ganancia
FROM clientes c
INNER JOIN pedidos p 
    ON c.CustomerID = p.CustomerID
INNER JOIN detalle_pedidos dp 
    ON p.OrderID = dp.OrderID
GROUP BY c.Segment;

/* Evolución de ingresos mes a mes para analizar tendencias a lo largo del tiempo. */
CREATE VIEW vw_evolucion_ventas AS
SELECT
    YEAR(p.OrderDate) AS Año,
    MONTH(p.OrderDate) AS Mes,
    SUM(dp.Sales) AS Ingresos
FROM pedidos p
INNER JOIN detalle_pedidos dp 
    ON p.OrderID = dp.OrderID
GROUP BY YEAR(p.OrderDate), MONTH(p.OrderDate);

/* Margen de ganancia general del negocio expresado como porcentaje sobre el total de ingresos. */
CREATE VIEW vw_margen_ganancia AS
SELECT
    SUM(Sales) AS Ingresos,
    SUM(Profit) AS Ganancia,
	(SUM(dp.Profit) * 100.0) / SUM(dp.Sales) AS MargenPorcentaje
FROM detalle_pedidos dp

select * FROM vw_evolucion_ventas