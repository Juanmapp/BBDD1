/*Crear una vista con los siguientes datos de los clientes: ID, contacto, y el
Fax. En caso de que no tenga Fax, colocar el teléfono, pero aclarándolo. Por
ejemplo: “TEL: (01) 123-4567”.*/

create view clientesTelefono as 
select clienteID, Contacto,
case
when fax is null or fax ="" then concat("TEL: ", telefono)
else fax
end as fax
from clientes    

/*Se necesita listar los números de teléfono de los clientes que no tengan
fax. Hacerlo de dos formas distintas:
a. Consultando la tabla de clientes.
b. Consultando la vista de clientes.*/

select telefono, contacto, fax from clientes
where fax is null or fax = ""

select fax, contacto from clientesTelefono
Where fax like "TEL: %"

/*Crear una vista con los siguientes datos de los proveedores: ID,
contacto, compañía y dirección. Para la dirección tomar la dirección,
ciudad, código postal y país.*/

create view ProveedoresView as
select ProveedorID, contacto, compania,
CONCAT(Direccion,", ",Ciudad, ", ", CodigoPostal,", ", Pais) as direccion
from proveedores

/*Listar los proveedores que vivan en la calle Americanas en Brasil. Hacerlo
de dos formas distintas:
a. Consultando la tabla de proveedores.
b. Consultando la vista de proveedores.*/

select ProveedorID from proveedores
WHERE Direccion like "%Americanas%" and pais like "Brazil"

select proveedorID from proveedoresView
WHERE Direccion like "%Americanas%" and direccion like "%Brazil%"

/*1. Crear una vista de productos que se usará para control de stock. Incluir el ID
y nombre del producto, el precio unitario redondeado sin decimales, las
unidades en stock y las unidades pedidas. Incluir además una nueva
columna PRIORIDAD con los siguientes valores:
■ BAJA: si las unidades pedidas son cero.
■ MEDIA: si las unidades pedidas son menores que las unidades
en stock.
■ URGENTE: si las unidades pedidas no duplican el número de
unidades.
■ SUPER URGENTE: si las unidades pedidas duplican el número
de unidades en caso contrario.*/

create view controlDeStock as
select productos.productoID, productoNombre, ROUND(PrecioUnitario, 0) as precioUnitario, UnidadesStock, UnidadesPedidas,
case 
	when unidadesPedidas = 0 then "BAJA"
    when unidadesPedidas < UnidadesStock then "MEDIA"
    when unidadesPedidas < (unidadesStock * 2) then "URGENTE"
    else "SUPERURGENTE"
end as prioridad
from productos

/*2. Se necesita un reporte de productos para identificar problemas de stock.
Para cada prioridad indicar cuántos productos hay y su precio promedio.
No incluir las prioridades para las que haya menos de 5 productos.*/

select SUM(unidadesStock) as unidades, AVG(precioUnitario) as promedio from controlDeStock
group by prioridad
having SUM(unidadesStock) >= 5



