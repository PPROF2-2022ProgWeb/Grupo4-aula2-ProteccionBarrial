CREATE DATABASE if not exists BBDDProteccionBarrial24;

use BBDDProteccionBarrial;

CREATE TABLE Usuario (
IdUsuario INT AUTO_INCREMENT,
 Nombre VARCHAR(30),
 Apellido VARCHAR(30),
 TipoDoc VARCHAR(30) NOT NULL,
 NroDoc VARCHAR(30) NOT NULL UNIQUE,
 Domicilio VARCHAR (20),
 Id_Barrio INT,
 Telefono INT,
 Mail VARCHAR (20) NOT NULL,
 PRIMARY KEY(IdUsuario),
 FOREIGN KEY(Id_Barrio) REFERENCES Barrio(IdBarrio) 
 );

CREATE TABLE UsuarioLogin (
 IdUserLogin INT PRIMARY KEY AUTO_INCREMENT NOT NULL ,
 Login VARCHAR(25) NOT NULL,
 Contraseña VARCHAR(10) NOT NULL,
 Id_Usuario INT NOT NULL,
 FOREIGN KEY (Id_Usuario) REFERENCES Usuario(IdUsuario)
 );


CREATE TABLE ContacServ (
 IdContactServ INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
 Policia numeric,
 Bombero NUMERIC,
 Emergencias NUMERIC,
 CentroVecinal NUMERIC
 );

CREATE TABLE Barrio (
 IdBarrio INT PRIMARY KEY AUTO_INCREMENT,
 NombreBarrio VARCHAR(40) NOT NULL,
 Codigo_Postal int not null,
 Id_Localidad int,
 Provincia varchar (50) not null,
 IdContact_Serv INT,
 FOREIGN KEY(Id_Localidad) REFERENCES Localidad(IdLocalidad),
 FOREIGN KEY(IdContact_Serv) REFERENCES ContacServ(IdContactServ)
 );

CREATE TABLE Localidad (
 IdLocalidad INT AUTO_INCREMENT, 
 Nombre_Localidad VARCHAR(30) NOT NULL, 
 PRIMARY KEY(IdLocalidad)
 );
