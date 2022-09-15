-- 1. Queremos tener un listado de todas las categorías.

select * from categorias

-- 2. Cómo las categorías no tienen imágenes, solamente interesa obtener un listado de CategoriaNombre y Descripcion;

select CategoriaNombre, Descripcion from categorias

-- 3. Obtener un listado de los productos.

select * from productos

-- 4. ¿Existen productos discontinuados? (Discontinuado = 1).
-- No hay productos discontinuados
select * from productos
order by discontinuado desc

-- 5. Para el viernes hay que reunirse con el Proveedor 8. ¿Qué productos son los que nos provee?

select * from productos
where proveedorID like "8"

-- 6. Queremos conocer todos los productos cuyo precio unitario se encuentre entre 10 y 22.

select * from productos
where PrecioUnitario between 10 and 22

-- 7. Se define que un producto hay que solicitarlo al proveedor si sus unidades en stock son menores al Nivel de Reorden. ¿Hay productos por solicitar?

select * from productos
where UnidadesStock < NivelReorden

-- 8. Se quiere conocer todos los productos del listado anterior, pero que unidades pedidas sea igual a cero.

select * from productos
where UnidadesStock < NivelReorden and unidadesPedidas = 0

-- Clientes
-- 1. Obtener un listado de todos los clientes con Contacto, Compania, Título, País. Ordenar el listado por País.
select contacto, compania, Titulo, Pais from clientes
order by Pais

-- 2. Queremos conocer a todos los clientes que tengan un título “Owner”.
select * from clientes
where titulo like "Owner"

-- 3. El operador telefónico que atendió a un cliente no recuerda su nombre. Solo sabe que comienza con “C”. ¿Lo ayudamos a obtener un listado con
-- todos los contactos que inician con la letra “C”?

select * from clientes
where Contacto like "c%"

-- Facturas
-- 1. Obtener un listado de todas las facturas, ordenado por fecha de factura ascendente.

select * from facturas
order by FechaFactura 

-- 2. Ahora se requiere un listado de las facturas con el país de envío “USA” y que su correo (EnvioVia) sea distinto de 3

select * from facturas
where paisEnvio like "USA" and EnvioVia <> 3

-- 3. ¿El cliente 'GOURL' realizó algún pedido?

select * from facturas
where Clienteid like "GOURL"

-- 4. Se quiere visualizar todas las facturas de los empleados 2, 3, 5, 8 y 9.

select * from facturas

-- Consultas queries ML - Parte II
-- En esta segunda parte vamos a intensificar la práctica de consultas
-- SELECT, añadiendo ALIAS, LIMIT y OFFSET.

-- Productos
-- 1. Obtener el listado de todos los productos ordenados
-- descendentemente por precio unitario.
select * from productos
order by precioUnitario DESC

-- 2. Obtener el listado de top 5 de productos cuyo precio unitario es
-- el más caro.

select * from productos
order by precioUnitario DESC
LIMIT 5

-- 3. Obtener un top 10 de los productos con más unidades en stock.

select * from productos
order by UnidadesStock DESC
LIMIT 10

-- FacturaDetalle
-- 1. Obtener un listado de FacturaID, Producto, Cantidad.

select FacturaID, ProductoID AS producto , Cantidad from facturaDetalle


--  2. Ordenar el listado anterior por cantidad descendentemente.

select FacturaID, ProductoID, Cantidad from facturaDetalle
ORDER BY cantidad desc

-- 3. Filtrar el listado solo para aquellos productos donde la cantidad
-- se encuentre entre 50 y 100.
select FacturaID, ProductoID, Cantidad from facturaDetalle
where cantidad between 50 and 100
ORDER BY cantidad desc

-- 4. En otro listado nuevo, obtener un listado con los siguientes
-- nombres de columnas: NroFactura (FacturaID), Producto
-- (ProductoID), Total (PrecioUnitario*Cantidad).

select FacturaID as NroFactura, ProductoID as Producto, (PrecioUnitario*Cantidad) AS total from facturaDetalle





