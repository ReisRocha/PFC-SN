-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: banconeon3
-- ------------------------------------------------------
-- Server version	8.0.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dadosbancarios`
--

DROP TABLE IF EXISTS `dadosbancarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dadosbancarios` (
  `Cod_Dados` int(11) NOT NULL AUTO_INCREMENT,
  `Cod_Funcionario` int(11) NOT NULL,
  `Banco` varchar(15) DEFAULT NULL,
  `AG` int(11) DEFAULT NULL,
  `Conta` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Cod_Dados`),
  KEY `Cod_Funcionario` (`Cod_Funcionario`),
  CONSTRAINT `dadosbancarios_ibfk_1` FOREIGN KEY (`Cod_Funcionario`) REFERENCES `funcionarios` (`Cod_Funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dadosbancarios`
--

LOCK TABLES `dadosbancarios` WRITE;
/*!40000 ALTER TABLE `dadosbancarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `dadosbancarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descontos`
--

DROP TABLE IF EXISTS `descontos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `descontos` (
  `Cod_desconto` int(11) NOT NULL AUTO_INCREMENT,
  `Cod_Funcionario` int(11) NOT NULL,
  `PorcentOuValor` enum('%','Val') NOT NULL,
  `Valor_Desconto` decimal(5,2) DEFAULT NULL,
  `PorcentagemDesc` int(11) DEFAULT NULL,
  `Descricao` tinytext,
  `Data_Desconto` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Cod_desconto`),
  KEY `Cod_Funcionario` (`Cod_Funcionario`),
  CONSTRAINT `descontos_ibfk_1` FOREIGN KEY (`Cod_Funcionario`) REFERENCES `funcionarios` (`Cod_Funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descontos`
--

LOCK TABLES `descontos` WRITE;
/*!40000 ALTER TABLE `descontos` DISABLE KEYS */;
/*!40000 ALTER TABLE `descontos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ferias`
--

DROP TABLE IF EXISTS `ferias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ferias` (
  `Cod_ferias` int(11) NOT NULL AUTO_INCREMENT,
  `Cod_Pagamento` int(11) NOT NULL,
  `Cod_Funcionario` int(11) NOT NULL,
  `InicioFerias` varchar(10) NOT NULL,
  `DiasFerias` int(11) NOT NULL,
  `AdiantamentoIRRF` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`Cod_ferias`),
  KEY `Cod_Pagamento` (`Cod_Pagamento`),
  KEY `Cod_Funcionario` (`Cod_Funcionario`),
  CONSTRAINT `ferias_ibfk_1` FOREIGN KEY (`Cod_Pagamento`) REFERENCES `pagamentos` (`Cod_Pagamento`),
  CONSTRAINT `ferias_ibfk_2` FOREIGN KEY (`Cod_Funcionario`) REFERENCES `funcionarios` (`Cod_Funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ferias`
--

LOCK TABLES `ferias` WRITE;
/*!40000 ALTER TABLE `ferias` DISABLE KEYS */;
/*!40000 ALTER TABLE `ferias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folha_de_ponto`
--

DROP TABLE IF EXISTS `folha_de_ponto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `folha_de_ponto` (
  `Cod_Ponto` int(11) NOT NULL AUTO_INCREMENT,
  `Cod_Funcionario` int(11) NOT NULL,
  `Data_Ponto` varchar(10) DEFAULT NULL,
  `Hora_Entrada` varchar(5) DEFAULT NULL,
  `Hora_Saida` varchar(5) DEFAULT NULL,
  `Inicio_Almoco` varchar(5) DEFAULT NULL,
  `Fim_Almoco` varchar(5) DEFAULT NULL,
  `Hora_Extra` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`Cod_Ponto`),
  KEY `Cod_Funcionario` (`Cod_Funcionario`),
  CONSTRAINT `folha_de_ponto_ibfk_1` FOREIGN KEY (`Cod_Funcionario`) REFERENCES `funcionarios` (`Cod_Funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folha_de_ponto`
--

LOCK TABLES `folha_de_ponto` WRITE;
/*!40000 ALTER TABLE `folha_de_ponto` DISABLE KEYS */;
/*!40000 ALTER TABLE `folha_de_ponto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `folha_pagamento`
--

DROP TABLE IF EXISTS `folha_pagamento`;
/*!50001 DROP VIEW IF EXISTS `folha_pagamento`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `folha_pagamento` AS SELECT 
 1 AS `Nome`,
 1 AS `CPF`,
 1 AS `Cargo`,
 1 AS `Banco`,
 1 AS `AG`,
 1 AS `Conta`,
 1 AS `Salario_Base`,
 1 AS `Porcento_Trienio`,
 1 AS `Porcento_INSS`,
 1 AS `Descricao`,
 1 AS `PorcentOuValor`,
 1 AS `Valor_Desconto`,
 1 AS `ValGratificacao`,
 1 AS `ValPago`,
 1 AS `DataPagamento`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `funcionarios` (
  `Cod_Funcionario` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_Funcionario` varchar(25) NOT NULL,
  `Sobre_Nome` varchar(30) NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `Data_Adimissao` varchar(10) NOT NULL,
  `Cargo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Cod_Funcionario`),
  UNIQUE KEY `CPF` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `historicopagamentos`
--

DROP TABLE IF EXISTS `historicopagamentos`;
/*!50001 DROP VIEW IF EXISTS `historicopagamentos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `historicopagamentos` AS SELECT 
 1 AS `Nome`,
 1 AS `CPF`,
 1 AS `Cargo`,
 1 AS `forma_de_Pagamento`,
 1 AS `Valor_Pago`,
 1 AS `Data_de_Pagamento`,
 1 AS `Banco`,
 1 AS `AG`,
 1 AS `Conta`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pagamentos`
--

DROP TABLE IF EXISTS `pagamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pagamentos` (
  `Cod_Pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `Cod_Dados` int(11) DEFAULT NULL,
  `Cod_Funcionario` int(11) NOT NULL,
  `FormaPagamento` tinytext NOT NULL,
  `ValGratificacao` decimal(5,2) DEFAULT NULL,
  `Alimentacao` decimal(5,2) DEFAULT NULL,
  `ValPago` decimal(5,2) NOT NULL,
  `DataPagamento` varchar(10) NOT NULL,
  PRIMARY KEY (`Cod_Pagamento`),
  KEY `Cod_Dados` (`Cod_Dados`),
  KEY `Cod_Funcionario` (`Cod_Funcionario`),
  CONSTRAINT `pagamentos_ibfk_1` FOREIGN KEY (`Cod_Dados`) REFERENCES `dadosbancarios` (`Cod_Dados`),
  CONSTRAINT `pagamentos_ibfk_2` FOREIGN KEY (`Cod_Funcionario`) REFERENCES `funcionarios` (`Cod_Funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamentos`
--

LOCK TABLES `pagamentos` WRITE;
/*!40000 ALTER TABLE `pagamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salario`
--

DROP TABLE IF EXISTS `salario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `salario` (
  `Cod_Salario` int(11) NOT NULL AUTO_INCREMENT,
  `Cod_Funcionario` int(11) NOT NULL,
  `Salario_Base` decimal(5,2) NOT NULL,
  `Porcento_Trienio` int(11) DEFAULT NULL,
  `Porcento_INSS` int(11) DEFAULT NULL,
  `Salario_Familha` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`Cod_Salario`),
  KEY `Cod_Funcionario` (`Cod_Funcionario`),
  CONSTRAINT `salario_ibfk_1` FOREIGN KEY (`Cod_Funcionario`) REFERENCES `funcionarios` (`Cod_Funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salario`
--

LOCK TABLES `salario` WRITE;
/*!40000 ALTER TABLE `salario` DISABLE KEYS */;
/*!40000 ALTER TABLE `salario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuarios` (
  `Cod_User` int(11) NOT NULL AUTO_INCREMENT,
  `Login` varchar(30) NOT NULL,
  `Senha` varchar(12) NOT NULL,
  PRIMARY KEY (`Cod_User`),
  UNIQUE KEY `Login` (`Login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `folha_pagamento`
--

/*!50001 DROP VIEW IF EXISTS `folha_pagamento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `folha_pagamento` AS select concat(`f`.`Nome_Funcionario`,`f`.`Sobre_Nome`) AS `Nome`,`f`.`CPF` AS `CPF`,`f`.`Cargo` AS `Cargo`,`da`.`Banco` AS `Banco`,`da`.`AG` AS `AG`,`da`.`Conta` AS `Conta`,`s`.`Salario_Base` AS `Salario_Base`,`s`.`Porcento_Trienio` AS `Porcento_Trienio`,`s`.`Porcento_INSS` AS `Porcento_INSS`,`d`.`Descricao` AS `Descricao`,`d`.`PorcentOuValor` AS `PorcentOuValor`,if((`d`.`PorcentOuValor` = '%'),`d`.`PorcentagemDesc`,`d`.`Valor_Desconto`) AS `Valor_Desconto`,`p`.`ValGratificacao` AS `ValGratificacao`,`p`.`ValPago` AS `ValPago`,`p`.`DataPagamento` AS `DataPagamento` from ((((`funcionarios` `f` join `dadosbancarios` `da` on((`f`.`Cod_Funcionario` = `da`.`Cod_Funcionario`))) join `salario` `s` on((`f`.`Cod_Funcionario` = `f`.`Cod_Funcionario`))) join `descontos` `d` on((`f`.`Cod_Funcionario` = `d`.`Cod_Funcionario`))) join `pagamentos` `p` on((`f`.`Cod_Funcionario` = `p`.`Cod_Funcionario`))) order by `f`.`Nome_Funcionario` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `historicopagamentos`
--

/*!50001 DROP VIEW IF EXISTS `historicopagamentos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `historicopagamentos` AS select concat(`f`.`Nome_Funcionario`,`f`.`Sobre_Nome`) AS `Nome`,`f`.`CPF` AS `CPF`,`f`.`Cargo` AS `Cargo`,`p`.`FormaPagamento` AS `forma_de_Pagamento`,`p`.`ValPago` AS `Valor_Pago`,`p`.`DataPagamento` AS `Data_de_Pagamento`,`d`.`Banco` AS `Banco`,`d`.`AG` AS `AG`,`d`.`Conta` AS `Conta` from ((`funcionarios` `f` join `pagamentos` `p` on((`f`.`Cod_Funcionario` = `p`.`Cod_Funcionario`))) join `dadosbancarios` `d` on((`d`.`Cod_Dados` = `p`.`Cod_Dados`))) order by `p`.`DataPagamento` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-22 16:22:12
