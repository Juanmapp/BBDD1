create database universoLector ;

use universoLector;

create table universoLector.socios(
codigo INT NOT NULL auto_increment, 
dni INT NOT NULL,
Apellido VARCHAR(100) NOT NULL,
Nombres VARCHAR(100) NOT NULL,
Direccion VARCHAR(200) NOT NULL,
Localidad VARCHAR(100) NOT NULL,
primary key (codigo)
);

create table editorial (
codigo INT NOT NULL auto_increment, 
razon_Social VARCHAR(100),
telefono VARCHAR(100) NOT NULL,
primary key (codigo)
);

create table autor (
codigo INT NOT NULL auto_increment, 
apellido VARCHAR(100) NOT NULL,
nombre VARCHAR(100) NOT NULL,
primary key (codigo)
);

create table telefonoxSocio (
codigo INT NOT NULL auto_increment, 
nroTelefono VARCHAR(100) NOT NULL,
codigo_Socio INT NOT NULL,
primary key (codigo)
const
Foreign key (codigo)
);




