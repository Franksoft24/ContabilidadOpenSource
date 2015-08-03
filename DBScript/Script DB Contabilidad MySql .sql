
/*
drop table CuentasContables;drop table CuentasContables_His;
drop table EntradaContable;drop table Estado;
drop table TiposCuentas;drop table TiposMoneda;
*/
CREATE TABLE CuentasContables(
	IdCuentaContable integer AUTO_INCREMENT primary key,
	Descripcion varchar(100) NULL,
	TipodeCuenta integer NULL,
	PermiteTransacciones char(2) NULL,
	Nivel integer NULL,
	CuentaMayor integer NULL,
	Balance decimal(18,2) NULL,
	Estado char(1) NULL);
    
CREATE TABLE CuentasContables_His(
	IdCuentaContable integer not null,
	Descripcion varchar(100) NULL,
	TipodeCuenta integer NULL,
	PermiteTransacciones char(2) NULL,
	Nivel integer NULL,
	CuentaMayor integer NULL,
	Balance decimal(18, 2) NULL,
	Estado char(1) NULL,
	Fecha datetime NULL
);

CREATE TABLE EntradaContable(
	IdEntradaContable integer AUTO_INCREMENT primary key,
	Descripcion varchar(100) NULL,
	ModuloContabilidad char(3) NULL,
	IdCuentaContable int NULL,
	Origen char(2) NULL,
	FechaAsiento datetime NULL,
	MontoAsiento decimal(18, 2) NULL,
	Idestado int NULL,
	IdTipoMoneda int NULL,
	IdUsuario int NULL,
	NumDocumento int NULL);
    
CREATE TABLE  Estado(
	Idestado integer AUTO_INCREMENT primary key,
	Descripcion varchar(50) NULL);

CREATE TABLE TiposCuentas(
	IdTipoCuenta integer AUTO_INCREMENT primary key,
	Descripcion varchar(100) NULL,
	Origen char(2) NULL,
	Estado char(1) NULL);

CREATE TABLE TiposMoneda(
	IdTipoMoneda integer AUTO_INCREMENT primary key,
	Descripcion varchar(100) NULL,
	UltimaTasa decimal(18, 2) NULL,
	Estado char(1) NULL);

create table Usuario(
	idUsuario integer AUTO_INCREMENT primary key,
	Usuario varchar(25),
	password varchar(25),
	mail varchar(100), 
	idrol integer,
	estado integer
	);

create table Rol(
	idRol integer AUTO_INCREMENT primary key, 
	descripcion varchar(100), 
	estado integer
	);

create   table tbl01 (
	IdEntradaContable	int,
	IdCuentaContable	int,
	Origen	char(2),
	FechaAsiento	datetime,
	MontoAsiento	decimal(18,2),
	Idestado	int,
	NumDocumento int,
    Tipodecuenta int
	);

create table tbl (idcuentacontable int, origen char(2), total decimal(18,2), nivel int, TipodeCuenta int);

create  table Cuenta 
	(idcuentacontable int ,
	 origen char(2),
	 total decimal(18,2),
	 nivel int,
	 tipodecuenta int
	 );

INSERT into Rol values(1,'Administrador', 1);
INSERT into usuario values (1,'Gerente', '123456', 'Gerente@gmail.com',1,1);

INSERT CuentasContables (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado) VALUES (1, 'Gastos', 1, 'No', 1, 0, CAST(11900.00 AS Decimal(18, 2)), 'A');
INSERT CuentasContables (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado) VALUES (2, 'Gastos generales y administrativos', 1, 'No', 2, 1, CAST(11900.00 AS Decimal(18, 2)), 'A');
INSERT CuentasContables (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado) VALUES (3, 'Gasto de Nomina', 1, 'SI', 3, 2, CAST(10400.00 AS Decimal(18, 2)), 'A');
INSERT CuentasContables (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado) VALUES (4, 'Gastos de immobilirios', 1, 'SI', 3, 2, CAST(11500.00 AS Decimal(18, 2)), 'A');
INSERT CuentasContables (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado) VALUES (5, 'Ingreso', 2, 'No', 1, 0, CAST(9800.00 AS Decimal(18, 2)), 'A');
INSERT CuentasContables (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado) VALUES (1001, 'Banco Popular', 2, 'Si', 2, 5, CAST(9800.00 AS Decimal(18, 2)), 'A');

INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (1, 'Gastos', 1, 'No', 1, 0, CAST(10000.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (2, 'Gastos Generales y admimnistrativos', 1, 'No', 2, 1, CAST(10000.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (3, 'Gastos de nomina', 1, 'SI', 3, 2, CAST(10000.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (4, 'Gastos de immobilirios', 1, 'SI', 3, 2, CAST(10000.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (5, 'Ingreso', 2, 'No', 1, 0, CAST(10000.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (1001, 'Ingresos variados', 2, 'Si', 2, 5, CAST(10000.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (1, 'Gastos', 1, 'No', 1, 0, CAST(8100.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (2, 'Gastos Generales y admimnistrativos', 1, 'No', 2, 1, CAST(8100.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (3, 'Gastos de nomina', 1, 'SI', 3, 2, CAST(9600.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (4, 'Gastos de immobilirios', 1, 'SI', 3, 2, CAST(8500.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (5, 'Ingreso', 2, 'No', 1, 0, CAST(10200.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (1001, 'Ingresos variados', 2, 'Si', 2, 5, CAST(10200.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (1, 'Gastos', 1, 'No', 1, 0, CAST(8100.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (2, 'Gastos Generales y admimnistrativos', 1, 'No', 2, 1, CAST(8100.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (3, 'Gastos de nomina', 1, 'SI', 3, 2, CAST(9600.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (4, 'Gastos de immobilirios', 1, 'SI', 3, 2, CAST(8500.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (5, 'Ingreso', 2, 'No', 1, 0, CAST(10200.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (1001, 'Ingresos variados', 2, 'Si', 2, 5, CAST(10200.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (1, 'Gastos', 1, 'No', 1, 0, CAST(8100.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (2, 'Gastos Generales y admimnistrativos', 1, 'No', 2, 1, CAST(8100.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (3, 'Gastos de nomina', 1, 'SI', 3, 2, CAST(9600.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (4, 'Gastos de immobilirios', 1, 'SI', 3, 2, CAST(8500.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (5, 'Ingreso', 2, 'No', 1, 0, CAST(10200.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (1001, 'Ingresos variados', 2, 'Si', 2, 5, CAST(10200.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (1, 'Gastos', 1, 'No', 1, 0, CAST(10000.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (2, 'Gastos Generales y admimnistrativos', 1, 'No', 2, 1, CAST(10000.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (3, 'Gastos de nomina', 1, 'SI', 3, 2, CAST(10000.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (4, 'Gastos de immobilirios', 1, 'SI', 3, 2, CAST(10000.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (5, 'Ingreso', 2, 'No', 1, 0, CAST(10000.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (1001, 'Ingresos variados', 2, 'Si', 2, 5, CAST(10000.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (1, 'Gastos', 1, 'No', 1, 0, CAST(10000.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (2, 'Gastos generales y administrativos', 1, 'No', 2, 1, CAST(10000.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (3, 'Gasto de Nomina', 1, 'SI', 3, 2, CAST(10000.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (4, 'Gastos de immobilirios', 1, 'SI', 3, 2, CAST(10000.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (5, 'Ingreso', 2, 'No', 1, 0, CAST(10000.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));
INSERT CuentasContables_His (IdCuentaContable, Descripcion, TipodeCuenta, PermiteTransacciones, Nivel, CuentaMayor, Balance, Estado, Fecha) VALUES (1001, 'Banco Popular', 2, 'Si', 2, 5, CAST(10000.00 AS Decimal(18, 2)), 'A', CAST('2015-08-02' AS DateTime));

INSERT EntradaContable (IdEntradaContable, Descripcion, ModuloContabilidad, IdCuentaContable, Origen, FechaAsiento, MontoAsiento, Idestado, IdTipoMoneda, IdUsuario, NumDocumento) VALUES (9, 'Pago nomina', 'Gas', 4, 'DB', CAST('2015-08-02' AS DateTime), CAST(500.00 AS Decimal(18, 2)), 2, 1, 1, NULL);
INSERT EntradaContable (IdEntradaContable, Descripcion, ModuloContabilidad, IdCuentaContable, Origen, FechaAsiento, MontoAsiento, Idestado, IdTipoMoneda, IdUsuario, NumDocumento) VALUES (10, 'Pago nomina', 'Gas', 4, 'DB', CAST('2015-08-02' AS DateTime), CAST(500.00 AS Decimal(18, 2)), 2, 1, 1, NULL);
INSERT EntradaContable (IdEntradaContable, Descripcion, ModuloContabilidad, IdCuentaContable, Origen, FechaAsiento, MontoAsiento, Idestado, IdTipoMoneda, IdUsuario, NumDocumento) VALUES (11, 'Pago nomina', 'Gas', 4, 'DB', CAST('2015-08-02' AS DateTime), CAST(500.00 AS Decimal(18, 2)), 2, 1, 1, NULL);
INSERT EntradaContable (IdEntradaContable, Descripcion, ModuloContabilidad, IdCuentaContable, Origen, FechaAsiento, MontoAsiento, Idestado, IdTipoMoneda, IdUsuario, NumDocumento) VALUES (12, 'Pago nomina', 'Gas', 3, 'DB', CAST('2015-08-02' AS DateTime), CAST(200.00 AS Decimal(18, 2)), 2, 1, 1, NULL);
INSERT EntradaContable (IdEntradaContable, Descripcion, ModuloContabilidad, IdCuentaContable, Origen, FechaAsiento, MontoAsiento, Idestado, IdTipoMoneda, IdUsuario, NumDocumento) VALUES (13, 'Pago nomina', 'Gas', 3, 'DB', CAST('2015-08-02' AS DateTime), CAST(200.00 AS Decimal(18, 2)), 2, 1, 1, NULL);
INSERT EntradaContable (IdEntradaContable, Descripcion, ModuloContabilidad, IdCuentaContable, Origen, FechaAsiento, MontoAsiento, Idestado, IdTipoMoneda, IdUsuario, NumDocumento) VALUES (14, 'Pago nomina', 'Gas', 1001, 'CR', CAST('2015-08-02' AS DateTime), CAST(100.00 AS Decimal(18, 2)), 2, 1, 1, NULL);
INSERT EntradaContable (IdEntradaContable, Descripcion, ModuloContabilidad, IdCuentaContable, Origen, FechaAsiento, MontoAsiento, Idestado, IdTipoMoneda, IdUsuario, NumDocumento) VALUES (15, 'Pago nomina', 'Gas', 1001, 'CR', CAST('2015-08-02' AS DateTime), CAST(100.00 AS Decimal(18, 2)), 2, 1, 1, NULL);

INSERT Estado (Idestado, Descripcion) VALUES (1, 'Realizada');
INSERT Estado (Idestado, Descripcion) VALUES (2, 'Aprobado');
INSERT Estado (Idestado, Descripcion) VALUES (3, 'Rechazada');

INSERT TiposCuentas (IdTipoCuenta, Descripcion, Origen, Estado) VALUES (1, 'Activo', 'DB', 'A');
INSERT TiposCuentas (IdTipoCuenta, Descripcion, Origen, Estado) VALUES (2, 'Pasivo', 'CR', 'A');
INSERT TiposCuentas (IdTipoCuenta, Descripcion, Origen, Estado) VALUES (3, 'Capital', 'DB', 'A');

INSERT TiposMoneda (IdTipoMoneda, Descripcion, UltimaTasa, Estado) VALUES (1, 'Peso', CAST(1.00 AS Decimal(18, 2)), 'A');

ALTER TABLE Usuario add constraint fk_idrol foreign key (idrol)
references Rol(idrol);

ALTER TABLE entradacontable add constraint fk_usuario foreign key (idUsuario)
references usuario(idUsuario);

ALTER TABLE CuentasContables   ADD  CONSTRAINT fk_tipodecuenta FOREIGN KEY(TipodeCuenta)
REFERENCES TiposCuentas (IdTipoCuenta);

ALTER TABLE CuentasContables   ADD  CONSTRAINT fk_tipodecuenta_his FOREIGN KEY(TipodeCuenta)
REFERENCES TiposCuentas (IdTipoCuenta)
;

ALTER TABLE EntradaContable   ADD  CONSTRAINT fk_estado FOREIGN KEY(Idestado)
REFERENCES Estado (Idestado)
;

ALTER TABLE EntradaContable   ADD  CONSTRAINT fk_idcuentacontable FOREIGN KEY(IdCuentaContable)
REFERENCES CuentasContables (IdCuentaContable)
;
ALTER TABLE EntradaContable   ADD  CONSTRAINT fk_idtipomoneda FOREIGN KEY(IdTipoMoneda)
REFERENCES TiposMoneda (IdTipoMoneda)
;

ALTER TABLE CuentasContables   ADD CHECK  (Estado='I' OR Estado='A')
;
ALTER TABLE CuentasContables   ADD CHECK  ((Estado='I' OR Estado='A'))
;
ALTER TABLE CuentasContables   ADD CHECK  ((Estado='I' OR Estado='A'))
;
ALTER TABLE CuentasContables   ADD CHECK  ((Estado='I' OR Estado='A'))
;
ALTER TABLE CuentasContables   ADD CHECK  ((PermiteTransacciones='NO' OR PermiteTransacciones='SI'))
;
ALTER TABLE CuentasContables   ADD CHECK  ((PermiteTransacciones='NO' OR PermiteTransacciones='SI'))
;
ALTER TABLE CuentasContables   ADD CHECK  ((PermiteTransacciones='NO' OR PermiteTransacciones='SI'))
;
ALTER TABLE CuentasContables   ADD CHECK  ((PermiteTransacciones='NO' OR PermiteTransacciones='SI'))
;
ALTER TABLE EntradaContable   ADD CHECK  ((Origen='CR' OR Origen='DB'))
;
ALTER TABLE TiposCuentas   ADD CHECK  ((Estado='I' OR Estado='A'))
;
ALTER TABLE TiposCuentas   ADD CHECK  ((Origen='CR' OR Origen='DB'))
;
ALTER TABLE TiposMoneda   ADD CHECK  ((Estado='I' OR Estado='A'))
;

CREATE procedure Usp_Transacciones
( in cta  int, in fechad date, in fechah date)

select		
		cta.IdCuentaContable AS CodigoCuentaContable,
			 cta.Descripcion AS CuentaContable,
	   ent.IdEntradaContable AS IdEntrada, 
		     mon.Descripcion AS Moneda, 
				  ent.Origen AS Origen,
	  ent.ModuloContabilidad AS Modulo,
			ent.FechaAsiento AS Fecha,
			ent.MontoAsiento AS Monto,
		  Estado.Descripcion AS Estado,
			u.usuario		 AS Usuario
from EntradaContable ent
inner join CuentasContables cta
on cta.IdCuentaContable=ent.IdCuentaContable 
inner join TiposMoneda mon
on mon.IdTipoMoneda=ent.IdTipoMoneda
inner join Estado 
on Estado.Idestado = ent.Idestado
inner join usuario u
on u.idUsuario = ent.idUsuario
where cta.IdCuentaContable in (cta)
and cast(ent.FechaAsiento as date) between fechad and fechah;

CREATE procedure Usp_EstadoCuenta()
    SELECT 
        m.IdCuentaContable,CONCAT(SPACE(m.Nivel*3),m.Descripcion) AS Jerarquia,
        m.Balance,tipo.Origen
    FROM CuentasContables m 
	inner join TiposCuentas tipo
	on tipo.IdTipoCuenta = m.TipodeCuenta
    order by 1
    ;

							 
DELIMITER //
CREATE procedure Usp_PaseCuentasMaestras(in v_Fecha date)
begin

	DECLARE v_ROW int;  
	DECLARE v_total INT;
	DECLARE v_IdCuentaContable INT;
    DECLARE v_Nivel INT;
    DECLARE v_TipodeCuenta INT;
  
			
            insert into CuentasContables_His	
			select *,  CURDATE() from CuentasContables;

			insert tbl
			select a.idcuentacontable, a.origen, 
            case when a.origen = 'CR' then sum(montoasiento)*-1 else sum(montoasiento) end as total, 
            b.nivel,b.TipodeCuenta
				from EntradaContable a
				inner join CuentasContables b on a.idcuentacontable = b.idcuentacontable
				where idestado=1 and CAST(fechaasiento AS DATE) = CAST(CURDATE() AS DATE)
		  group by a.idcuentacontable, a.origen,b.nivel,b.TipodeCuenta
		  order by 1;
	
 			SET v_ROW = (SELECT COUNT(*) FROM tbl);
	
	  WHILE v_ROW > 0  DO
	

			delete from Cuenta;
	
    insert into Cuenta
			SELECT  * FROM tbl limit 1;
            
    SET v_total = (select total from Cuenta);
	SET v_IdCuentaContable =(select IdCuentaContable from Cuenta);
    SET v_Nivel =(select Nivel from Cuenta);
    SET v_TipodeCuenta =(select TipodeCuenta from Cuenta);
    
                SET SQL_SAFE_UPDATES=0;
				update CuentasContables c
					left outer join (
											SELECT m.IdCuentaContable,
												CONCAT(SPACE(m.Nivel*3),m.Descripcion) AS Jerarquia,
												m.Balance,tipo.Origen
											FROM CuentasContables m 
							          inner join TiposCuentas tipo
											on tipo.IdTipoCuenta = m.TipodeCuenta
									)r
						on c.IdCuentaContable = r.IdCuentaContable
					   set c.Balance = c.Balance + v_total /*(select total from Cuenta) */
					  where R.IdCuentaContable < v_IdCuentaContable /*(select IdCuentaContable from Cuenta)*/
					   and c.Nivel < v_Nivel /*(select Nivel from Cuenta)*/
					   and c.TipodeCuenta = v_TipodeCuenta/*(select TipodeCuenta from Cuenta)*/
					   and c.PermiteTransacciones = 'No'; 
				
                SET SQL_SAFE_UPDATES=0;
 					update CuentasContables a
				inner join Cuenta b
						on a.IdCuentaContable=b.idcuentacontable 
					   and a.PermiteTransacciones='Si'
					   set a.Balance= a.Balance+ b.total;
				
                SET SQL_SAFE_UPDATES=0;
					update EntradaContable a
				inner join Cuenta b
						on a.IdCuentaContable=b.idcuentacontable
					   set a.Idestado=2
					 where idestado=1 
                     and cast(fechaasiento as date)=v_Fecha;
			
			SET v_ROW = v_ROW-1;
			DELETE from tbl WHERE idcuentacontable = v_IdCuentaContable/*(select idcuentacontable from CUENTA)*/;			
	END WHILE;
    delete from tbl;
	end //
    DELIMITER ;
    		
	
	
	delimiter //			  

	drop trigger trg_upd_CtaContable;
	delimiter //	
    
delimiter //	
    
create trigger trg_upd_CtaContable 
	before update on EntradaContable for each row
begin
	DECLARE v_total INT;
	DECLARE v_IdCuentaContable INT;
	DECLARE v_TipodeCuenta INT;
    DECLARE v_Monto INT;
    DECLARE v_Tipodecuenta2 INT;

			if old.Idestado = 3 then
            
				if old.origen = 'CR' then
				set v_Monto = old.montoasiento * -1;
				else
				set v_Monto = old.montoasiento;
				end if;
            
				set v_Tipodecuenta2 = (select a.Tipodecuenta from CuentasContables a where a.idcuentacontable = old.idcuentacontable );		
				insert into tbl01 values(old.IdEntradaContable,old.IdCuentaContable,old.Origen,old.FechaAsiento,v_Monto,old.Idestado,old.NumDocumento, v_Tipodecuenta2 );
            end if;
		    
    SET v_total = (select MontoAsiento from tbl01);
	SET v_IdCuentaContable =(select IdCuentaContable from tbl01);
	SET v_TipodeCuenta =(select TipodeCuenta from tbl01);
    
				SET SQL_SAFE_UPDATES=0;
						    update CuentasContables c
                            /*select * from CuentasContables c*/
				   left outer join (
											SELECT m.IdCuentaContable,
												   CONCAT(SPACE(m.Nivel*3),
                                                   m.Descripcion) AS Jerarquia,
												   m.Balance,tipo.Origen, m.PermiteTransacciones
											  FROM CuentasContables m 
										inner join TiposCuentas tipo
											    on tipo.IdTipoCuenta = m.TipodeCuenta
									)a
								on c.IdCuentaContable=a.IdCuentaContable
								and a.IdCuentaContable=v_IdCuentaContable
							   set c.Balance = c.Balance + v_total
                               where c.PermiteTransacciones = 'No' 
							   and c.TipodeCuenta = v_TipodeCuenta; 
                               
						SET SQL_SAFE_UPDATES=0;
                        update CuentasContables a
						   set a.Balance = a.Balance + v_total
						 where a.IdCuentaContable=v_IdCuentaContable 
						   and a.PermiteTransacciones='Si';
						   
                           delete from tbl01;
		
        end //
        DELIMITER ;
        
        
        