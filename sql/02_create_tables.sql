USE RetailSalesDB;

CREATE TABLE clientes(
	CustomerID VARCHAR(50) PRIMARY KEY,
	Segment VARCHAR(50) NOT NULL,
)

CREATE TABLE ubicaciones(
	LocationID INT PRIMARY KEY,
	Country VARCHAR(50) NOT NULL,
	City VARCHAR(50) NOT NULL,
	State VARCHAR(50) NOT NULL,
	Region VARCHAR(50) NOT NULL
)

CREATE TABLE pedidos(
	OrderID VARCHAR(50) PRIMARY KEY,
	OrderDate DATE NOT NULL,
	ShipDate DATE NOT NULL,
	ShipMode VARCHAR(50) NOT NULL,
	CustomerID VARCHAR(50) NOT NULL,
	LocationID INT NOT NULL,
	
	CONSTRAINT fk_clientes
	FOREIGN KEY (CustomerID)
	REFERENCES clientes(CustomerID),

	CONSTRAINT fk_ubicaciones
	FOREIGN KEY (LocationID)
	REFERENCES ubicaciones(LocationID)
)

CREATE TABLE productos(
	ProductID VARCHAR(50) PRIMARY KEY,
	Category VARCHAR(50) NOT NULL,
	SubCategory VARCHAR(50) NOT NULL,
	ProductName VARCHAR(255) NOT NULL
)

CREATE TABLE detalle_pedidos (
	RowID INT PRIMARY KEY,
	Quantity INT NOT NULL,
	Sales FLOAT NOT NULL,
	Discount DECIMAL(5,4) NOT NULL DEFAULT 0
		CHECK (Discount >= 0 AND Discount <= 1),
	Profit FLOAT NOT NULL,
	OrderID VARCHAR(50) NOT NULL,
	ProductID VARCHAR(50) NOT NULL,

	CONSTRAINT fk_pedidos
	FOREIGN KEY (OrderID)
	REFERENCES pedidos(OrderID),

	CONSTRAINT fk_productos
	FOREIGN KEY (ProductID)
	REFERENCES productos(ProductID)
)