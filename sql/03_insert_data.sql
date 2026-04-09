USE RetailSalesDB;_

BULK INSERT clientes
FROM 'C:\Users\Fede-pc\Documents\trabajo coder\retail-sales-analysis\data\cleaned\CLIENTE.csv'
WITH (
	FIRSTROW = 2, 
	FIELDTERMINATOR = ',', 
	ROWTERMINATOR = '\n', 
	CODEPAGE = '65001', 
	TABLOCK
);

BULK INSERT ubicaciones
FROM 'C:\Users\Fede-pc\Documents\trabajo coder\retail-sales-analysis\data\cleaned\UBICACION.csv'
WITH (
	FIRSTROW = 2
	, FIELDTERMINATOR = ','
	, ROWTERMINATOR = '\n',
	CODEPAGE = '65001', 
	TABLOCK
);

BULK INSERT productos
FROM 'C:\Users\Fede-pc\Documents\trabajo coder\retail-sales-analysis\data\cleaned\PRODUCTO.csv'
WITH (
	FIRSTROW = 2, 
	FIELDTERMINATOR = ',', 
	ROWTERMINATOR = '\n', 
	CODEPAGE = '65001', 
	TABLOCK
);

BULK INSERT pedidos
FROM 'C:\Users\Fede-pc\Documents\trabajo coder\retail-sales-analysis\data\cleaned\PEDIDO.csv'
WITH (
	FIRSTROW = 2, 
	FIELDTERMINATOR = ',', 
	ROWTERMINATOR = '\n', 
	CODEPAGE = '65001', 
	TABLOCK
);

BULK INSERT detalle_pedidos
FROM 'C:\Users\Fede-pc\Documents\trabajo coder\retail-sales-analysis\data\cleaned\DETALLE_DEL_PEDIDO.csv'
WITH (
	FIRSTROW = 2, 
	FIELDTERMINATOR = ',', 
	ROWTERMINATOR = '\n', 
	CODEPAGE = '65001', 
	TABLOCK
);