create database if not exists CompañiaAerea;
use CompañiaAerea;
create table Avion(
Matricula varchar(45) primary key not null,
Fabricante varchar(45) not null,
Modelo varchar(45) not null,
Capacidad int not null,
Autonomia int not null
);
create table Vuelo(
IDVuelo varchar(45) primary key not null,
Matricula varchar(45) not null,
Origen varchar(45) not null,
Destino varchar(45) not null,
Fecha date not null,
constraint fk_vuelo_avion
foreign key(Matricula) references Avion(Matricula)
);
create table Pasajero(
DniPasajero char(9) primary key not null,
Nombre varchar(45) not null,
Apellidos varchar(45) not null,
Email varchar(45) not null
);
create table CategoriaProfesional(
CodigoCategoria varchar(45) primary key not null,
Nombre varchar(45)
);
create table Personal(
IDTrabajador varchar(45) primary key not null,
CodigoCategoria varchar(45) not null,
Nombre varchar(45) not null,
Apellido1 varchar(45) not null,
Apellido2 varchar(45) null,
constraint fk_Personal_CategoriaProfesional
foreign key(CodigoCategoria) references CategoriaProfesional(CodigoCategoria)
);
create table TelefonoPersonal(
IDTrabajador varchar(45)  not null,
Telefono char(9)  not null,
constraint fk_TelefonoPersonal_Personal
foreign key (IDTrabajador) references Personal(IDTrabajador),
primary key(IDTrabajador, Telefono)
);
create table Puesto(
IDTrabajador varchar(45)  not null,
IDVuelo varchar(45)  not null,
Puesto varchar(10) not null,
constraint fk_Puesto_Personal
foreign key (IDTrabajador) references Personal(IDTrabajador),
constraint fk_puesto_Vuelo
foreign key (IDVuelo) references Vuelo(IDVuelo), 
primary key(IDTrabajador, IDVuelo)
);
create table Distribucion(
DNIPasajero char(9)  not null,
IDVuelo varchar(10)  not null,
Asiento varchar(8) not null,
Clase varchar (15) not null,
constraint fk_Distribucion_Pasajero
foreign key (DNIPasajero) references Pasajero(DNIPasajero),
constraint fk_Distribucion_Vuelo
foreign key (IDVuelo) references Vuelo(IDVuelo),
primary key(DNIPasajero, IDVuelo)
);
create table TelefonoPasajero(
DNIPasajero char(9)  not null,
Telefono char(9)  not null,
constraint fk_TelefonoPasajero_Pasajero
foreign key (DNIPasajero) references Pasajero(DNIPasajero),
primary key(DNIPasajero, Telefono)
);
-----------------------
NUEVAS SENTENCIAS
-----------------------
alter database CompañiaAerea character set utf8mb4 collate utf8mb4_unicode_ci;
alter table Avion modify Capacidad smallint unsigned check (Capacidad<=450) not null;
alter table Avion modify Autonomia tinyint unsigned null check (Autonomia<=48);
alter table Distribucion modify Asiento smallint not null check(Asiento>0);
alter table Distribucion modify Clase varchar(15) not null auto_increment;
alter table Avion rename Aeroplano;