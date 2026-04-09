USE RetailSalesDB;

/*¿Cuáles son los 10 productos más vendidos por ingresos?*/
SELECT TOP 10
	p.ProductName, 
	SUM(dp.Sales) AS Ingresos
FROM productos p
INNER JOIN detalle_pedidos dp 
	ON p.ProductID = dp.ProductID
GROUP BY p.ProductName
ORDER BY Ingresos DESC

/*¿Qué categoría y sub-categoría generan más ganancia?*/
SELECT
	p.Category,
	p.SubCategory,
	SUM(dp.Profit) AS Ganancia
FROM productos p
INNER JOIN detalle_pedidos dp
	ON p.ProductID = dp.ProductID 
GROUP BY p.Category,p.SubCategory
ORDER BY Category DESC

/*¿Qué impacto tiene el descuento en la ganancia por producto?*/
SELECT
    p.ProductName,
    p.Category,
    p.SubCategory,
    AVG(dp.Discount) AS PromedioDescuento,
    AVG(dp.Profit) AS PromedioGanancia
FROM productos p
INNER JOIN detalle_pedidos dp ON p.ProductID = dp.ProductID
GROUP BY p.ProductName, p.Category, p.SubCategory
ORDER BY PromedioDescuento DESC;


/*¿Qué región genera más ingresos?*/
SELECT
	u.Region,
	SUM(dp.sales) AS ingresos
FROM ubicaciones u
INNER JOIN pedidos p
	ON u.LocationID = p.LocationID
INNER JOIN detalle_pedidos dp
	ON p.OrderID = dp.OrderID
GROUP BY u.Region
ORDER BY ingresos DESC

/*¿Hay ciudades con ventas altas pero pérdidas?*/
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
HAVING SUM(dp.Profit) < 0
ORDER BY Ventas DESC

/*¿Qué segmento de clientes genera más ventas?*/
SELECT
	c.Segment,
	SUM(dp.sales) AS Ingresos
FROM clientes c
INNER JOIN pedidos p
	ON c.CustomerID = p.CustomerID
INNER JOIN detalle_pedidos dp
	ON p.OrderID = dp.OrderID
GROUP BY c.Segment

/*¿Cómo evolucionan las ventas mes a mes?*/
SELECT
	YEAR(p.OrderDate) AS Año,
	MONTH(p.OrderDate) AS Mes,
	SUM(dp.sales) AS Ventas
FROM pedidos p
INNER JOIN detalle_pedidos dp
	ON p.OrderID = dp.OrderID
GROUP BY YEAR(p.OrderDate), MONTH(p.OrderDate)
ORDER BY Año, Mes

/*¿Cuál es el margen de ganancia general del negocio?*/
SELECT
    SUM(Sales) AS Ingresos,
    SUM(Profit) AS Ganancia,
	(SUM(dp.Profit) * 100.0) / SUM(dp.Sales) AS MargenPorcentaje
FROM detalle_pedidos dp

