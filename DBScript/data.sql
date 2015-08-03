-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: contabilidad
-- ------------------------------------------------------
-- Server version	5.6.25-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cuentascontables`
--

LOCK TABLES `cuentascontables` WRITE;
/*!40000 ALTER TABLE `cuentascontables` DISABLE KEYS */;
INSERT INTO `cuentascontables` VALUES (1,'Gastos',1,'No',1,0,11900.00,'A'),(2,'Gastos generales y administrativos',1,'No',2,1,11900.00,'A'),(3,'Gasto de Nomina',1,'SI',3,2,10400.00,'A'),(4,'Gastos de immobilirios',1,'SI',3,2,11500.00,'A'),(5,'Ingreso',1,'NO',1,0,9800.00,'A'),(1001,'Banco Popular',1,'SI',2,1002,9800.00,'A'),(1002,'Bancos',1,'NO',1,0,0.00,'A'),(1003,'Gastos Materiales gastables',1,'SI',3,2,0.00,'A'),(1004,'Caja Chica',1,'NO',2,5,0.00,'A'),(1005,'Compras',1,'SI',3,1004,25000.00,'A'),(1007,'Cuenta Pago Nomina',1,'SI',3,1001,1000000.00,'A');
/*!40000 ALTER TABLE `cuentascontables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cuentascontables_his`
--

LOCK TABLES `cuentascontables_his` WRITE;
/*!40000 ALTER TABLE `cuentascontables_his` DISABLE KEYS */;
INSERT INTO `cuentascontables_his` VALUES (1,'Gastos',1,'No',1,0,10000.00,'A','2015-08-02 00:00:00'),(2,'Gastos Generales y admimnistrativos',1,'No',2,1,10000.00,'A','2015-08-02 00:00:00'),(3,'Gastos de nomina',1,'SI',3,2,10000.00,'A','2015-08-02 00:00:00'),(4,'Gastos de immobilirios',1,'SI',3,2,10000.00,'A','2015-08-02 00:00:00'),(5,'Ingreso',2,'No',1,0,10000.00,'A','2015-08-02 00:00:00'),(1001,'Ingresos variados',2,'Si',2,5,10000.00,'A','2015-08-02 00:00:00'),(1,'Gastos',1,'No',1,0,8100.00,'A','2015-08-02 00:00:00'),(2,'Gastos Generales y admimnistrativos',1,'No',2,1,8100.00,'A','2015-08-02 00:00:00'),(3,'Gastos de nomina',1,'SI',3,2,9600.00,'A','2015-08-02 00:00:00'),(4,'Gastos de immobilirios',1,'SI',3,2,8500.00,'A','2015-08-02 00:00:00'),(5,'Ingreso',2,'No',1,0,10200.00,'A','2015-08-02 00:00:00'),(1001,'Ingresos variados',2,'Si',2,5,10200.00,'A','2015-08-02 00:00:00'),(1,'Gastos',1,'No',1,0,8100.00,'A','2015-08-02 00:00:00'),(2,'Gastos Generales y admimnistrativos',1,'No',2,1,8100.00,'A','2015-08-02 00:00:00'),(3,'Gastos de nomina',1,'SI',3,2,9600.00,'A','2015-08-02 00:00:00'),(4,'Gastos de immobilirios',1,'SI',3,2,8500.00,'A','2015-08-02 00:00:00'),(5,'Ingreso',2,'No',1,0,10200.00,'A','2015-08-02 00:00:00'),(1001,'Ingresos variados',2,'Si',2,5,10200.00,'A','2015-08-02 00:00:00'),(1,'Gastos',1,'No',1,0,8100.00,'A','2015-08-02 00:00:00'),(2,'Gastos Generales y admimnistrativos',1,'No',2,1,8100.00,'A','2015-08-02 00:00:00'),(3,'Gastos de nomina',1,'SI',3,2,9600.00,'A','2015-08-02 00:00:00'),(4,'Gastos de immobilirios',1,'SI',3,2,8500.00,'A','2015-08-02 00:00:00'),(5,'Ingreso',2,'No',1,0,10200.00,'A','2015-08-02 00:00:00'),(1001,'Ingresos variados',2,'Si',2,5,10200.00,'A','2015-08-02 00:00:00'),(1,'Gastos',1,'No',1,0,10000.00,'A','2015-08-02 00:00:00'),(2,'Gastos Generales y admimnistrativos',1,'No',2,1,10000.00,'A','2015-08-02 00:00:00'),(3,'Gastos de nomina',1,'SI',3,2,10000.00,'A','2015-08-02 00:00:00'),(4,'Gastos de immobilirios',1,'SI',3,2,10000.00,'A','2015-08-02 00:00:00'),(5,'Ingreso',2,'No',1,0,10000.00,'A','2015-08-02 00:00:00'),(1001,'Ingresos variados',2,'Si',2,5,10000.00,'A','2015-08-02 00:00:00'),(1,'Gastos',1,'No',1,0,10000.00,'A','2015-08-02 00:00:00'),(2,'Gastos generales y administrativos',1,'No',2,1,10000.00,'A','2015-08-02 00:00:00'),(3,'Gasto de Nomina',1,'SI',3,2,10000.00,'A','2015-08-02 00:00:00'),(4,'Gastos de immobilirios',1,'SI',3,2,10000.00,'A','2015-08-02 00:00:00'),(5,'Ingreso',2,'No',1,0,10000.00,'A','2015-08-02 00:00:00'),(1001,'Banco Popular',2,'Si',2,5,10000.00,'A','2015-08-02 00:00:00');
/*!40000 ALTER TABLE `cuentascontables_his` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `entradacontable`
--

LOCK TABLES `entradacontable` WRITE;
/*!40000 ALTER TABLE `entradacontable` DISABLE KEYS */;
INSERT INTO `entradacontable` VALUES (9,'Pago nomina','Gas',4,'DB','2015-08-02 00:00:00',500.00,2,1,1,NULL),(10,'Pago nomina','Gas',4,'DB','2015-08-02 00:00:00',500.00,2,1,1,NULL),(11,'Pago nomina','Gas',4,'DB','2015-08-02 00:00:00',500.00,2,1,1,NULL),(12,'Pago nomina','Gas',3,'DB','2015-08-02 00:00:00',200.00,2,1,1,NULL),(13,'Pago nomina','Gas',3,'DB','2015-08-02 00:00:00',200.00,2,1,1,NULL),(14,'Pago nomina','Gas',1001,'CR','2015-08-02 00:00:00',100.00,2,1,1,NULL),(15,'Pago nomina','Gas',1001,'CR','2015-08-02 00:00:00',100.00,2,1,1,NULL),(16,'Compras de utilez para oficina','GAS',1005,'DB','2015-08-03 00:00:00',12000.73,1,1,2,1),(17,'Compras de utilez para oficina','GAS',1003,'CR','2015-08-03 00:00:00',12000.73,1,1,2,1),(18,'Compra de sillon','GAS',1005,'DB','2015-08-03 00:00:00',1500.00,1,1,2,2),(19,'Compra de sillon','GAS',4,'CR','2015-08-03 00:00:00',1500.00,1,1,2,2),(24,'Pago Nomina','GAS',3,'DB','2015-07-03 00:00:00',15000.00,3,1,5,3),(25,'Pago Nomina','GAS',1007,'CR','2015-08-03 00:00:00',15000.00,3,1,2,3),(26,'Pago Nomina','GAS',3,'DB','2015-07-03 00:00:00',15500.00,1,1,5,4),(27,'Pago Nomina','GAS',1007,'CR','2015-07-03 00:00:00',15500.00,1,1,5,4);
/*!40000 ALTER TABLE `entradacontable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Realizada'),(2,'Aprobado'),(3,'Rechazada');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador',1),(2,'Empleado',1),(3,'Invitado',1),(4,'Nomina',1);
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tbl`
--

LOCK TABLES `tbl` WRITE;
/*!40000 ALTER TABLE `tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tbl01`
--

LOCK TABLES `tbl01` WRITE;
/*!40000 ALTER TABLE `tbl01` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl01` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tiposcuentas`
--

LOCK TABLES `tiposcuentas` WRITE;
/*!40000 ALTER TABLE `tiposcuentas` DISABLE KEYS */;
INSERT INTO `tiposcuentas` VALUES (1,'Activo','DB','A'),(2,'Pasivo','CR','A'),(3,'Capital','DB','A');
/*!40000 ALTER TABLE `tiposcuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tiposmoneda`
--

LOCK TABLES `tiposmoneda` WRITE;
/*!40000 ALTER TABLE `tiposmoneda` DISABLE KEYS */;
INSERT INTO `tiposmoneda` VALUES (1,'Peso',1.00,'A'),(2,'Dolar',45.57,'A');
/*!40000 ALTER TABLE `tiposmoneda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Gerente','123456','Gerente@gmail.com',1,1),(2,'Franksoft','@dministr@dor2','frankmer@contabilidad.com',1,1),(3,'Empleado','mejorp@go2','empleado@contabilidad.com',2,1),(4,'Radhames','holamundo@2','radhames@contabilidad.com',3,1),(5,'Nomina','p@goNomina2','nomina@nomina.com',4,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-03 19:01:32
