-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.0.17-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for contabilidad
DROP DATABASE IF EXISTS `contabilidad`;
CREATE DATABASE IF NOT EXISTS `contabilidad` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `contabilidad`;


-- Dumping structure for table contabilidad.cuentascontables
DROP TABLE IF EXISTS `cuentascontables`;
CREATE TABLE IF NOT EXISTS `cuentascontables` (
  `IdCuentaContable` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  `TipodeCuenta` int(11) DEFAULT NULL,
  `PermiteTransacciones` char(2) DEFAULT NULL,
  `Nivel` int(11) DEFAULT NULL,
  `CuentaMayor` int(11) DEFAULT NULL,
  `Balance` decimal(18,2) DEFAULT NULL,
  `Estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`IdCuentaContable`),
  KEY `fk_tipodecuenta` (`TipodeCuenta`),
  CONSTRAINT `fk_tipodecuenta` FOREIGN KEY (`TipodeCuenta`) REFERENCES `tiposcuentas` (`IdTipoCuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table contabilidad.cuentascontables: ~1 rows (approximately)
DELETE FROM `cuentascontables`;
/*!40000 ALTER TABLE `cuentascontables` DISABLE KEYS */;
INSERT INTO `cuentascontables` (`IdCuentaContable`, `Descripcion`, `TipodeCuenta`, `PermiteTransacciones`, `Nivel`, `CuentaMayor`, `Balance`, `Estado`) VALUES
	(1, 'Gastos Generales', 1, 'SI', 1, NULL, 25000.00, 'A');
/*!40000 ALTER TABLE `cuentascontables` ENABLE KEYS */;


-- Dumping structure for table contabilidad.entradacontable
DROP TABLE IF EXISTS `entradacontable`;
CREATE TABLE IF NOT EXISTS `entradacontable` (
  `IdEntradaContable` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  `ModuloContabilidad` char(3) DEFAULT NULL,
  `IdCuentaContable` int(11) DEFAULT NULL,
  `Origen` char(2) DEFAULT NULL,
  `Usuario` int(11) DEFAULT NULL,
  `FechaAsiento` datetime DEFAULT NULL,
  `MontoAsiento` decimal(18,2) DEFAULT NULL,
  `Estado` char(1) DEFAULT NULL,
  `IdTipoMoneda` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdEntradaContable`),
  KEY `fk_idcuentacontable` (`IdCuentaContable`),
  KEY `fk_idtipomoneda` (`IdTipoMoneda`),
  KEY `FK_entradacontable_usuarios` (`Usuario`),
  CONSTRAINT `FK_entradacontable_usuarios` FOREIGN KEY (`Usuario`) REFERENCES `usuarios` (`IdUsuario`),
  CONSTRAINT `fk_idcuentacontable` FOREIGN KEY (`IdCuentaContable`) REFERENCES `cuentascontables` (`IdCuentaContable`),
  CONSTRAINT `fk_idtipomoneda` FOREIGN KEY (`IdTipoMoneda`) REFERENCES `tiposmoneda` (`IdTipoMoneda`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table contabilidad.entradacontable: ~4 rows (approximately)
DELETE FROM `entradacontable`;
/*!40000 ALTER TABLE `entradacontable` DISABLE KEYS */;
INSERT INTO `entradacontable` (`IdEntradaContable`, `Descripcion`, `ModuloContabilidad`, `IdCuentaContable`, `Origen`, `Usuario`, `FechaAsiento`, `MontoAsiento`, `Estado`, `IdTipoMoneda`) VALUES
	(1, 'PAGO DE COMPRA DE DETERGENTES', 'GAS', 1, 'DB', 2, '2015-07-07 00:00:00', 3000.00, 'A', 1),
	(2, 'Compra de equipo de oficina', 'GAS', 1, 'DB', 4, '2015-07-09 11:17:11', 25000.00, 'A', 1),
	(3, 'Prueba del modulo contabilidad', 'GAS', 1, 'US', 4, '2015-07-09 00:00:00', 1500.00, 'A', 1),
	(4, 'prueba de eliminacion', 'ELM', 1, 'US', 2, '2015-07-09 00:00:00', 150000.00, 'A', 1);
/*!40000 ALTER TABLE `entradacontable` ENABLE KEYS */;


-- Dumping structure for table contabilidad.rol
DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `IdRol` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`IdRol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table contabilidad.rol: ~3 rows (approximately)
DELETE FROM `rol`;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` (`IdRol`, `Descripcion`) VALUES
	(1, 'Administrador'),
	(2, 'Usuario'),
	(3, 'Invitado');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;


-- Dumping structure for table contabilidad.tiposcuentas
DROP TABLE IF EXISTS `tiposcuentas`;
CREATE TABLE IF NOT EXISTS `tiposcuentas` (
  `IdTipoCuenta` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Origen` char(2) DEFAULT NULL,
  `Estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`IdTipoCuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table contabilidad.tiposcuentas: ~1 rows (approximately)
DELETE FROM `tiposcuentas`;
/*!40000 ALTER TABLE `tiposcuentas` DISABLE KEYS */;
INSERT INTO `tiposcuentas` (`IdTipoCuenta`, `Descripcion`, `Origen`, `Estado`) VALUES
	(1, 'CXC', 'DB', 'A');
/*!40000 ALTER TABLE `tiposcuentas` ENABLE KEYS */;


-- Dumping structure for table contabilidad.tiposmoneda
DROP TABLE IF EXISTS `tiposmoneda`;
CREATE TABLE IF NOT EXISTS `tiposmoneda` (
  `IdTipoMoneda` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  `UltimaTasa` decimal(18,2) DEFAULT NULL,
  `Estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`IdTipoMoneda`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table contabilidad.tiposmoneda: ~1 rows (approximately)
DELETE FROM `tiposmoneda`;
/*!40000 ALTER TABLE `tiposmoneda` DISABLE KEYS */;
INSERT INTO `tiposmoneda` (`IdTipoMoneda`, `Descripcion`, `UltimaTasa`, `Estado`) VALUES
	(1, 'Peso', 1.00, 'A');
/*!40000 ALTER TABLE `tiposmoneda` ENABLE KEYS */;


-- Dumping structure for table contabilidad.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `IdUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `NickName` varchar(50) NOT NULL,
  `Mail` varchar(50) NOT NULL,
  `Password` varchar(128) NOT NULL,
  `Rol` int(11) NOT NULL,
  PRIMARY KEY (`IdUsuario`),
  UNIQUE KEY `NickName` (`NickName`),
  UNIQUE KEY `Mail` (`Mail`),
  KEY `FK_usuarios_rol` (`Rol`),
  CONSTRAINT `FK_usuarios_rol` FOREIGN KEY (`Rol`) REFERENCES `rol` (`IdRol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table contabilidad.usuarios: ~5 rows (approximately)
DELETE FROM `usuarios`;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`IdUsuario`, `NickName`, `Mail`, `Password`, `Rol`) VALUES
	(1, 'Administrador', 'admin@webmail.com', 'hol@mundo1', 1),
	(2, 'Empleado', 'empleado@webmail.com', 'mejorp@go2', 2),
	(3, 'JoseFD', 'JoseFD@webmail.com', 'prueb@depass', 2),
	(4, 'Franksoft', 'contact@frankmer.ner', '@dministr@dor2', 1),
	(5, 'Radhames', 'Radha@gmail.com', 'holamundo@2', 3);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
