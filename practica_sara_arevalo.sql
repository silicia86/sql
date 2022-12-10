-- Creo el esquema

create schema sara_arevalo authorization piottgsu;

-- Creo las tablas

create table sara_arevalo.vehiculos(
	idVehiculo varchar(10) not null, -- PK
	idModelo varchar(10) not null,  --FK -> modelos (idModelo)
	idColor varchar(10) not null,  --FK -> colores (idColor)
	matricula varchar(10) not null,
	kilometros numeric(10,2) not null,
	idAseguradora varchar(10) not null, --FK -> aseguradoras (idAseguradoras)
	num_poliza integer not null,
	fecha_compra date not null,
	comentarios varchar(200) null
);


create table sara_arevalo.modelos(
	idModelo varchar(10) not null,  --PK
	idMarca varchar(10) not null,  --FK -> marcas (idMarca)
	nombre_modelo varchar(50) not null,
	comentarios varchar(200) null
);

create table sara_arevalo.marcas(
	idMarca varchar(10) not null,  --PK
	idGrupo varchar(10) null,  --FK -> grupos (idGrupo)
	nombre_marca varchar(50) not null,
	comentarios varchar(200) null
);


create table sara_arevalo.grupos(
	idGrupo varchar(10) not null,  --PK
	nombre_grupo varchar(50) not null,
	comentarios varchar(200) null
);


create table sara_arevalo.colores(
	idColor varchar(10) not null,  --PK
	color varchar(20) not null,
	comentarios varchar(200) null
);


create table sara_arevalo.aseguradoras(
	idAseguradora varchar(10) not null,  --PK
	empresa varchar(50) not null,
	comentarios varchar(200) null
);

create table sara_arevalo.revisiones(
	idRevision varchar(10) not null,  --PK
	idVehiculo varchar(10) not null, -- FK -> vehiculos (idVehiculo)
	kilometros_rev numeric(10,2) not null,
	fecha_rev date not null,
	importe numeric(5,2) not null,
	idMoneda varchar(10) not null,  --FK -> monedas (idMoneda) 
	comentarios varchar(200) null
);


create table sara_arevalo.moneda(
	idMoneda varchar(10) not null,  --PK
	moneda varchar(20) not null,
	comentarios varchar(200) null
);

-- Defino las PK

alter table sara_arevalo.vehiculos 
add constraint vehiculos_pk primary key (idVehiculo);

alter table sara_arevalo.revisiones  
add constraint revisiones_pk primary key (idRevision);

alter table sara_arevalo.aseguradoras  
add constraint aseguradoras_pk primary key (idAseguradora);

alter table sara_arevalo.modelos  
add constraint modelos_pk primary key (idModelo);

alter table sara_arevalo.colores 
add constraint colores_pk primary key (idColor);

alter table sara_arevalo.marcas  
add constraint marcas_pk primary key (idMarca);

alter table sara_arevalo.grupos 
add constraint grupos_pk primary key (idGrupo);

alter table sara_arevalo.moneda 
add constraint moneda_pk primary key (idMoneda);

-- Defino las FK

alter table sara_arevalo.vehiculos 
add constraint modelo_fk foreign key (idModelo)
references sara_arevalo.modelos (idModelo);

alter table sara_arevalo.vehiculos 
add constraint color_fk foreign key (idColor)
references sara_arevalo.colores (idColor),
add constraint aseguradora_fk foreign key (idAseguradora)
references sara_arevalo.aseguradoras (idAseguradora);

alter table sara_arevalo.revisiones  
add constraint revisiones_fk foreign key (idVehiculo)
references sara_arevalo.vehiculos (idVehiculo);

alter table sara_arevalo.modelos  
add constraint marcas_fk foreign key (idMarca)
references sara_arevalo.marcas (idMarca);

alter table sara_arevalo.marcas  
add constraint grupos_fk foreign key (idGrupo)
references sara_arevalo.grupos (idGrupo);

alter table sara_arevalo.revisiones
add constraint moneda_fk foreign key (idMoneda)
references sara_arevalo.moneda (idMoneda);

-- Introduzco datos

insert into sara_arevalo.moneda (idmoneda, moneda, comentarios) values ('01', 'Euro', '');
insert into sara_arevalo.moneda (idmoneda, moneda, comentarios) values ('02' , 'USD' , ' ');
insert into sara_arevalo.moneda (idmoneda, moneda, comentarios) values ('03' , 'Peso' , ' ');
insert into sara_arevalo.moneda (idmoneda, moneda, comentarios) values ('04' , 'Rublo' , ' ');

insert into sara_arevalo.colores (idcolor, color, comentarios) values ('C001','Blanco', ' ');
insert into sara_arevalo.colores (idcolor, color, comentarios) values ('C002','Rojo', ' ');
insert into sara_arevalo.colores (idcolor, color, comentarios) values ('C003','Azul', ' ');
insert into sara_arevalo.colores (idcolor, color, comentarios) values ('C004','Negro', ' ');
insert into sara_arevalo.colores (idcolor, color, comentarios) values ('C005','Gris', ' ');
insert into sara_arevalo.colores (idcolor, color, comentarios) values ('C006','Verde', ' ');
insert into sara_arevalo.colores (idcolor, color, comentarios) values ('C007','Amarillo', ' ');
insert into sara_arevalo.colores (idcolor, color, comentarios) values ('C008','Naranja', ' ');

insert into sara_arevalo.grupos (idgrupo, nombre_grupo, comentarios) values ('G01','Volkswagen', ' ');
insert into sara_arevalo.grupos (idgrupo, nombre_grupo, comentarios) values ('G02','Renault_Nissan', ' ');
insert into sara_arevalo.grupos (idgrupo, nombre_grupo, comentarios) values ('G03','PSA', ' ');

insert into sara_arevalo.marcas (idmarca, idgrupo, nombre_marca, comentarios) values ('MA01','G01','Seat', ' ');
insert into sara_arevalo.marcas (idmarca, idgrupo, nombre_marca, comentarios) values ('MA02','G02','Nissan', ' ');
insert into sara_arevalo.marcas (idmarca, idgrupo, nombre_marca, comentarios) values ('MA03','G03','Opel', ' ');
insert into sara_arevalo.marcas (idmarca, idgrupo, nombre_marca, comentarios) values ('MA04','G01','VW', ' ');
insert into sara_arevalo.marcas (idmarca, idgrupo, nombre_marca, comentarios) values ('MA05','G01','Audi', ' ');

insert into sara_arevalo.modelos (idmodelo, idmarca, nombre_modelo, comentarios) values ('M001','MA01','Ibiza', ' ');
insert into sara_arevalo.modelos (idmodelo, idmarca, nombre_modelo, comentarios) values ('M002','MA01','Leon', ' ');
insert into sara_arevalo.modelos (idmodelo, idmarca, nombre_modelo, comentarios) values ('M003','MA03','Corsa', ' ');
insert into sara_arevalo.modelos (idmodelo, idmarca, nombre_modelo, comentarios) values ('M004','MA02','Qashqai', ' ');
insert into sara_arevalo.modelos (idmodelo, idmarca, nombre_modelo, comentarios) values ('M005','MA03','Astra', ' ');
insert into sara_arevalo.modelos (idmodelo, idmarca, nombre_modelo, comentarios) values ('M006','MA04','Tiguan', ' ');
insert into sara_arevalo.modelos (idmodelo, idmarca, nombre_modelo, comentarios) values ('M007','MA05','A3', ' ');
insert into sara_arevalo.modelos (idmodelo, idmarca, nombre_modelo, comentarios) values ('M008','MA03','Mokka', ' ');

insert into sara_arevalo.aseguradoras (idaseguradora, empresa, comentarios) values ('A001','Mapfre', ' ');
insert into sara_arevalo.aseguradoras (idaseguradora, empresa, comentarios) values ('A002','Axa', ' ');
insert into sara_arevalo.aseguradoras (idaseguradora, empresa, comentarios) values ('A003','Mutua', ' ');
insert into sara_arevalo.aseguradoras (idaseguradora, empresa, comentarios) values ('A004','Fenix', ' ');

insert into sara_arevalo.vehiculos (idvehiculo, idmodelo, idcolor, matricula, kilometros, idaseguradora, num_poliza, fecha_compra, comentarios) values ('V001','M005','C003','1540BBC','16000','A001','100900','2010-01-01',' ');
insert into sara_arevalo.vehiculos (idvehiculo, idmodelo, idcolor, matricula, kilometros, idaseguradora, num_poliza, fecha_compra, comentarios) values ('V002','M001','C001','1541BBC','3500','A001','100901','2010-01-02', ' ');
insert into sara_arevalo.vehiculos (idvehiculo, idmodelo, idcolor, matricula, kilometros, idaseguradora, num_poliza, fecha_compra, comentarios) values ('V003','M005','C007','1542BBC','6300','A002','100902','2010-01-03', ' ');
insert into sara_arevalo.vehiculos (idvehiculo, idmodelo, idcolor, matricula, kilometros, idaseguradora, num_poliza, fecha_compra, comentarios) values ('V004','M002','C004','1543BBC','8400','A003','100903','2010-01-04', ' ');
insert into sara_arevalo.vehiculos (idvehiculo, idmodelo, idcolor, matricula, kilometros, idaseguradora, num_poliza, fecha_compra, comentarios) values ('V005','M003','C001','1544BBC','15800','A003','100904','2010-01-05', ' ');
insert into sara_arevalo.vehiculos (idvehiculo, idmodelo, idcolor, matricula, kilometros, idaseguradora, num_poliza, fecha_compra, comentarios) values ('V006','M003','C005','8074FCD','5000','A002','100905','2015-01-01', ' ');
insert into sara_arevalo.vehiculos (idvehiculo, idmodelo, idcolor, matricula, kilometros, idaseguradora, num_poliza, fecha_compra, comentarios) values ('V007','M005','C003','8075FCD','14200','A002','100906','2015-02-01', ' ');
insert into sara_arevalo.vehiculos (idvehiculo, idmodelo, idcolor, matricula, kilometros, idaseguradora, num_poliza, fecha_compra, comentarios) values ('V008','M006','C006','8076FCD','2500','A003','100907','2015-01-02', ' ');
insert into sara_arevalo.vehiculos (idvehiculo, idmodelo, idcolor, matricula, kilometros, idaseguradora, num_poliza, fecha_compra, comentarios) values ('V009','M002','C007','8077FCD','3200','A003','100908','2015-02-02', ' ');
insert into sara_arevalo.vehiculos (idvehiculo, idmodelo, idcolor, matricula, kilometros, idaseguradora, num_poliza, fecha_compra, comentarios) values ('V010','M004','C008','8078FCD','1000','A004','100909','2020-08-01', ' ');
insert into sara_arevalo.vehiculos (idvehiculo, idmodelo, idcolor, matricula, kilometros, idaseguradora, num_poliza, fecha_compra, comentarios) values ('V011','M005','C003','8079FCD','4100','A002','100910','2020-08-02', ' ');
insert into sara_arevalo.vehiculos (idvehiculo, idmodelo, idcolor, matricula, kilometros, idaseguradora, num_poliza, fecha_compra, comentarios) values ('V012','M007','C001','8080FCD','2300','A003','100911','2020-08-03', ' ');
insert into sara_arevalo.vehiculos (idvehiculo, idmodelo, idcolor, matricula, kilometros, idaseguradora, num_poliza, fecha_compra, comentarios) values ('V013','M003','C005','4579KLM','1400','A004','100912','2020-08-04', ' ');
insert into sara_arevalo.vehiculos (idvehiculo, idmodelo, idcolor, matricula, kilometros, idaseguradora, num_poliza, fecha_compra, comentarios) values ('V014','M008','C004','4580KLM','600','A004','100913','2020-08-05', ' ');
insert into sara_arevalo.vehiculos (idvehiculo, idmodelo, idcolor, matricula, kilometros, idaseguradora, num_poliza, fecha_compra, comentarios) values ('V015','M007','C005','4581KLM','1000','A003','100914','2020-08-06', ' ');

insert into sara_arevalo.revisiones (idrevision, idvehiculo, kilometros_rev, fecha_rev, importe, idMoneda, comentarios) values ('R001','V005','10000','2022-01-01','120','01', ' ');
insert into sara_arevalo.revisiones (idrevision, idvehiculo, kilometros_rev, fecha_rev, importe, idMoneda, comentarios) values ('R002','V001','5000','2022-01-02','500','01', ' ');
insert into sara_arevalo.revisiones (idrevision, idvehiculo, kilometros_rev, fecha_rev, importe, idMoneda, comentarios) values ('R003','V007','9000','2022-01-03','300','01', ' ');
insert into sara_arevalo.revisiones (idrevision, idvehiculo, kilometros_rev, fecha_rev, importe, idMoneda, comentarios) values ('R004','V004','6000','2022-01-04','800','02', ' ');
insert into sara_arevalo.revisiones (idrevision, idvehiculo, kilometros_rev, fecha_rev, importe, idMoneda, comentarios) values ('R005','V005','15000','2022-05-01','400','01', ' ');
insert into sara_arevalo.revisiones (idrevision, idvehiculo, kilometros_rev, fecha_rev, importe, idMoneda, comentarios) values ('R006','V010','1000','2022-06-01','150','01', ' ');
insert into sara_arevalo.revisiones (idrevision, idvehiculo, kilometros_rev, fecha_rev, importe, idMoneda, comentarios) values ('R007','V007','13000','2022-07-01','630','01', ' ');
insert into sara_arevalo.revisiones (idrevision, idvehiculo, kilometros_rev, fecha_rev, importe, idMoneda, comentarios) values ('R008','V002','2000','2022-08-01','420','01', ' ');
insert into sara_arevalo.revisiones (idrevision, idvehiculo, kilometros_rev, fecha_rev, importe, idMoneda, comentarios) values ('R009','V001','10000','2022-09-01','540','03', ' ');
insert into sara_arevalo.revisiones (idrevision, idvehiculo, kilometros_rev, fecha_rev, importe, idMoneda, comentarios) values ('R010','V003','6000','2022-10-01','130','01', ' ');
insert into sara_arevalo.revisiones (idrevision, idvehiculo, kilometros_rev, fecha_rev, importe, idMoneda, comentarios) values ('R011','V006','4000','2022-11-01','140','01', ' ');
insert into sara_arevalo.revisiones (idrevision, idvehiculo, kilometros_rev, fecha_rev, importe, idMoneda, comentarios) values ('R012','V004','8000','2022-12-01','640','01', ' ');
insert into sara_arevalo.revisiones (idrevision, idvehiculo, kilometros_rev, fecha_rev, importe, idMoneda, comentarios) values ('R013','V009','3000','2022-12-02','80','01', ' ');
insert into sara_arevalo.revisiones (idrevision, idvehiculo, kilometros_rev, fecha_rev, importe, idMoneda, comentarios) values ('R014','V011','4000','2022-12-03','110','01', ' ');
insert into sara_arevalo.revisiones (idrevision, idvehiculo, kilometros_rev, fecha_rev, importe, idMoneda, comentarios) values ('R015','V001','15000','2022-12-04','60','01', ' ');
insert into sara_arevalo.revisiones (idrevision, idvehiculo, kilometros_rev, fecha_rev, importe, idMoneda, comentarios) values ('R016','V005','20000','2022-12-05','240','01', ' ');
insert into sara_arevalo.revisiones (idrevision, idvehiculo, kilometros_rev, fecha_rev, importe, idMoneda, comentarios) values ('R017','V002','3000','2022-12-06','360','01', ' ');



