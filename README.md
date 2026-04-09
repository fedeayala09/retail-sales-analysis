# Retail Sales Analysis

Proyecto de análisis de datos end-to-end sobre un dataset de ventas retail,
recorriendo el ciclo completo desde la limpieza del dato hasta la visualización
de insights de negocio.

## Herramientas utilizadas

- **Microsoft Excel 365** — exploración inicial y normalización de datos con Power Query
- **SQL Server** — modelado relacional, consultas, vistas y stored procedures
- **Power BI Desktop** — dashboard interactivo con 4 páginas de análisis

## Dataset

Sample Superstore — disponible en [Kaggle](https://www.kaggle.com/datasets/naveenkumar20bps1137/sample-superstore/data)

Contiene 9,994 registros de ventas de una empresa retail ficticia de Estados Unidos
con información de órdenes, clientes, productos y regiones geográficas.

## Modelo de datos

El dataset original fue normalizado en 5 tablas:

- `clientes` — información de cada cliente único
- `ubicaciones` — combinaciones únicas de ubicación geográfica
- `pedidos` — órdenes de compra vinculadas a clientes y ubicaciones
- `detalle_pedidos` — líneas de venta vinculadas a pedidos y productos
- `productos` — catálogo de productos

## Estructura del repositorio

```
retail-sales-analysis/
├── data/
│   ├── raw/          ← dataset original sin modificaciones
│   └── cleaned/      ← archivos CSV normalizados
├── sql/
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   ├── 03_insert_data.sql
│   ├── 04_queries.sql
│   ├── 05_views.sql
│   └── 06_stored_procedures.sql
├── powerbi/
│   └── retail_sales_analysis.pbix
└── docs/
    ├── Retail_Sales_Analysis_Documentation.docx
    └── retail_sales_analysis_wireframe.fig
```


## Principales hallazgos

- **West** es la región con mayor volumen de ingresos ($725K), superando a South por $333K
- **Technology-Copiers** es la subcategoría más rentable con $149,528 de ganancia
- Existe una correlación negativa entre descuento y margen: subcategorías con 37% de descuento promedio registran márgenes de -19%
- El segmento **Consumer** concentra el 50.6% de las ventas totales
- Ciudades como **Lancaster** y **San Antonio** presentan ventas relevantes pero resultados negativos

## Contacto

[LinkedIn](https://www.linkedin.com/in/federico-ayala)
