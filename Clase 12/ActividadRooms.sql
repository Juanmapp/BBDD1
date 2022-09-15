-- Listar las canciones que poseen la letra “z” en su título.

select titulo from cancion
where titulo like "%z%"

-- Listar las canciones que poseen como segundo carácter la letra “a” y como último, la letra “s”.

select titulo from cancion
where titulo like "_a%s"

-- Mostrar la playlist que tiene más canciones, renombrando las columnas poniendo mayúsculas en la primera letra, los tildes correspondientes y agregar los espacios entre palabras.

select idPlaylist as "Id Playlist", idusuario as "Id Usuario", titulo as "Título", cantcanciones as "Cantidad de Canciones", idestado as "Id Estado", fechacreacion as "Fecha de Creación", fechaEliminada as "Fecha Eliminada" from playlist 
order by cantcanciones desc;

-- En otro momento se obtuvo un listado con los 5 usuarios más jóvenes, obtener un listado de los 10 siguientes.

SELECT * FROM proyecto_spotify.usuario
order by fecha_nac DESC
limit 10
offset 5

-- Listar las 5 canciones con más reproducciones, ordenadas descendentemente.

select * from cancion
order by cantreproduccion DESC
limit 5


-- Generar un reporte de todos los álbumes ordenados alfabéticamente.

select * from album
order by titulo

-- Listar todos los álbumes que no tengan imagen, ordenados alfabéticamente.

select * from album
where imagenportada is null

-- Insertar un usuario nuevo con los siguientes datos (tener en cuenta las relaciones):
select * from usuario
INSERT INTO usuario(idUsuario, nombreusuario, nyap, password, fecha_nac, sexo, cp, Pais_idPais)
VALUES (20, "nuevousuariodespotify@gmail.com", "Elmer Gomez", "S4321m", "1991-11-15","M", "B4129ATF", 2)
select * from pais
UPDATE usuario
set nombreusuario = "EGOMEZ", password = "S4321M", nyap = "ELMER GOMEZ"
where idUsuario = 20
-- a) nombreusuario: nuevousuariodespotify@gmail.com

-- b) Nombre y apellido: Elmer Gomez

-- c) password: S4321m

-- d) Fecha de nacimiento: 15/11/1991

-- e) Sexo: Masculino

-- f) Código Postal: B4129ATF

-- g) País: Colombia

-- Eliminar todas las canciones de género “pop”.

-- Editar todos los artistas que no tengan una imagen cargada y cargarles el texto “Imagen faltante” en la columna de imagen. 

select * from artista
UPDATE artista
set imagen = "Imagen faltante"
where imagen is null