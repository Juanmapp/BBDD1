SELECT id as "Numero de huesped", apellido, nombre FROM huesped
where nombre like "S%"

select * from empleado
where domicilio like "Av. Rosalind Franklin 600"

select * from reserva
order by IMPORTE desc
select  MAX(importe)  from reserva

select * from reserva
where id = 15 OR ID = 19 OR ID = 21 OR ID = 35

select habitacion_numero as "Número de habitación", importe as "Importe Total"  from checkin
where habitacion_numero = 40
select habitacion_numero as "Número de habitación", sum(importe) as "Importe Total"  from checkin
where habitacion_numero = 40

select * from empleado
where sector_id != 3 and fecha_nacimiento > 1989-09-03 OR fecha_nacimiento = 1986-11-07
order by fecha_nacimiento 

select * from reserva
where importe > 10499.50 and importe <= 12000
order by importe desc

select * from checkin
ORDER BY importe
LIMIT 1
offset 5 

select max(importe), id, fecha_entrada from checkin


select id, importe,  from checkin
ORDER BY importe
LIMIT 1
offset 5 

select * from reserva
order by fecha
where huesped_id like 40 >= '00:00:00 2021-07-14'

select * from checkin
where importe >= 34125 and fecha_salida < 2020-6-26

select * from reserva
-- where fecha between 2021-07-14 and 2021-08-15
order by fecha
