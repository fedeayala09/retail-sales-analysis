# Retail Sales Analysis

Análisis de datos end-to-end sobre un dataset de ventas retail, recorriendo el ciclo completo desde la limpieza y modelado del dato hasta la visualización de insights accionables de negocio.

## Dashboard

### Resumen General
![Resumen General](docs/screenshots/Resumen_General.png)

### Productos y Categorías
![Productos y Categorías](docs/screenshots/Productos_y_Categorías.png)

### Clientes y Segmentos
![Clientes y Segmentos](docs/screenshots/Clientes_y_Segmentos.png)

### Análisis Geográfico
![Análisis Geográfico](docs/screenshots/Análisis_Geográfico.png)

---

## Herramientas utilizadas

- **Microsoft Excel 365** — exploración inicial y normalización de datos con Power Query
- **SQL Server** — modelado relacional, consultas analíticas, vistas y stored procedures
- **Power BI Desktop** — dashboard interactivo con 4 páginas de análisis

---

## Dataset

Sample Superstore — disponible en [Kaggle](https://www.kaggle.com/datasets/naveenkumar20bps1137/sample-superstore/data)

Contiene 9,994 registros de ventas de una empresa retail ficticia de Estados Unidos con información de órdenes, clientes, productos y regiones geográficas.

---

## Modelo de datos

El dataset original fue normalizado en un modelo relacional de 5 tablas:

| Tabla | Descripción |
|---|---|
| `clientes` | Información de cada cliente único |
| `ubicaciones` | Combinaciones únicas de ubicación geográfica |
| `pedidos` | Órdenes de compra vinculadas a clientes y ubicaciones |
| `detalle_pedidos` | Líneas de venta vinculadas a pedidos y productos |
| `productos` | Catálogo de productos con categoría y subcategoría |

---

## Estructura del repositorio

```
retail-sales-analysis/
├── data/
│   ├── raw/          ← dataset original sin modificaciones
│   └── cleaned/      ← archivos CSV normalizados por tabla
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
    ├── screenshots/
    ├── Retail_Sales_Analysis_Documentation.docx
    └── retail_sales_analysis_wireframe.fig
```

---

## Principales hallazgos

| # | Hallazgo | Detalle |
|---|---|---|
| 1 | **West lidera ingresos** | $725K en ventas, $333K por encima de South |
| 2 | **Technology-Copiers es la subcategoría más rentable** | $149K de ganancia neta |
| 3 | **Los descuentos altos destruyen margen** | Subcategorías con 37% de descuento promedio registran márgenes de -19% |
| 4 | **Consumer domina las ventas** | Concentra el 50.6% del total de ingresos |
| 5 | **Ciudades con pérdidas ocultas** | Lancaster y San Antonio generan ventas relevantes pero resultados negativos |

---

## Recomendaciones de negocio

### 1. Revisar la política de descuentos urgente
El scatter plot de impacto del descuento sobre la ganancia muestra una correlación negativa clara: a mayor descuento, menor (o negativo) margen. Subcategorías con descuentos superiores al 30% están operando en pérdida. **Recomendación:** establecer un tope máximo de descuento por subcategoría basado en el margen histórico, priorizando eliminar o reducir descuentos en las categorías que ya son deficitarias.

### 2. Potenciar la región West y replicar su modelo
West lidera tanto en ingresos ($725K) como en ganancia ($108K). Analizar qué mix de productos, segmentos de clientes y estrategias comerciales predominan en esa región permite identificar prácticas exportables a Central y South, que muestran ratios ingreso/ganancia menores.

### 3. Investigar y corregir las ciudades con pérdidas estructurales
Lancaster, San Antonio y Chicago generan ventas considerables pero resultados negativos. Esto sugiere problemas de pricing, descuentos excesivos o costos logísticos elevados en esas plazas. **Recomendación:** auditar el detalle de órdenes en esas ciudades para identificar qué productos o segmentos concentran las pérdidas antes de decidir si ajustar precios, limitar descuentos o desinvertir.

### 4. Priorizar inversión en Technology
Technology es la categoría con mayor ganancia, liderada por Copiers ($149K). Furniture, en contraste, muestra márgenes muy bajos y algunas subcategorías en rojo. **Recomendación:** redirigir esfuerzos comerciales hacia productos tecnológicos de alto margen y evaluar la rentabilidad real de continuar operando subcategorías de Furniture deficitarias.

### 5. Profundizar el segmento Consumer
Con el 50.6% de las ventas, Consumer es el segmento más importante. Sin embargo, su alta participación también lo hace el más sensible a descuentos. **Recomendación:** segmentar Consumer por frecuencia de compra y ticket promedio para identificar clientes de alto valor y diseñar estrategias de retención diferenciadas.

---

## Contacto

[LinkedIn](https://www.linkedin.com/in/federico-ayala) · [GitHub](https://github.com/fedeayala09)
