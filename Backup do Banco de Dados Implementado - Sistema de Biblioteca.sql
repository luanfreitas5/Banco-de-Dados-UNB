CREATE DATABASE  IF NOT EXISTS `biblioteca` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `biblioteca`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteca
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `afiliacao`
--

DROP TABLE IF EXISTS `afiliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afiliacao` (
  `id_Afiliacao` int(11) NOT NULL AUTO_INCREMENT,
  `nome_Pai` varchar(100) NOT NULL,
  `nome_Mae` varchar(100) NOT NULL,
  `id_Aluno` int(11) DEFAULT NULL,
  `id_Professor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Afiliacao`),
  KEY `aluno_afiliacao_fk` (`id_Aluno`),
  KEY `professor_afiliacao_fk` (`id_Professor`),
  CONSTRAINT `aluno_afiliacao_fk` FOREIGN KEY (`id_Aluno`) REFERENCES `aluno` (`id_Aluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `professor_afiliacao_fk` FOREIGN KEY (`id_Professor`) REFERENCES `professor` (`id_Professor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afiliacao`
--

LOCK TABLES `afiliacao` WRITE;
/*!40000 ALTER TABLE `afiliacao` DISABLE KEYS */;
INSERT INTO `afiliacao` VALUES (1,'wanderley','glaucia',1,NULL),(2,'joao','isabela',2,NULL),(3,'vinicius','beatriz',3,NULL),(4,'miguel','claudia',4,NULL),(5,'bruno','carol',5,NULL),(6,'gabriel','fernanda',NULL,1),(7,'pedro','clara',NULL,2),(8,'luis','amanda',NULL,3),(9,'alexandre','taís',NULL,4),(10,'rafael','jessica',NULL,5);
/*!40000 ALTER TABLE `afiliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno` (
  `id_Aluno` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `matricula` varchar(20) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `id_Sexo` int(11) NOT NULL,
  `id_Cor_Pele` int(11) NOT NULL,
  `id_Estado_Civil` int(11) NOT NULL,
  `id_Naturalidade` int(11) NOT NULL,
  PRIMARY KEY (`id_Aluno`),
  KEY `cor_pele_aluno_fk` (`id_Cor_Pele`),
  KEY `sexo_aluno_fk` (`id_Sexo`),
  KEY `estado_civil_aluno_fk` (`id_Estado_Civil`),
  KEY `naturalidade_aluno_fk` (`id_Naturalidade`),
  CONSTRAINT `cor_pele_aluno_fk` FOREIGN KEY (`id_Cor_Pele`) REFERENCES `cor_pele` (`id_Cor_Pele`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `estado_civil_aluno_fk` FOREIGN KEY (`id_Estado_Civil`) REFERENCES `estado_civil` (`id_Estado_Civil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `naturalidade_aluno_fk` FOREIGN KEY (`id_Naturalidade`) REFERENCES `naturalidade` (`id_Naturalidade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sexo_aluno_fk` FOREIGN KEY (`id_Sexo`) REFERENCES `sexo` (`id_Sexo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,'luan','1','11111111111',1,2,2,1),(2,'jose','2','22222222222',1,3,3,2),(3,'katia','3','33333333333',2,3,1,4),(4,'marcos','2','22222222222',1,1,3,3),(5,'alice','2','22222222222',2,3,2,1);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area_conhecimento`
--

DROP TABLE IF EXISTS `area_conhecimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_conhecimento` (
  `id_Area_Conhecimento` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id_Area_Conhecimento`),
  UNIQUE KEY `area_conhecimento_nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_conhecimento`
--

LOCK TABLES `area_conhecimento` WRITE;
/*!40000 ALTER TABLE `area_conhecimento` DISABLE KEYS */;
INSERT INTO `area_conhecimento` VALUES (4,'filosofia'),(1,'informatica'),(2,'linguagens de programação'),(5,'qualidade de software'),(3,'sociedade de computação');
/*!40000 ALTER TABLE `area_conhecimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area_conhecimento_livro`
--

DROP TABLE IF EXISTS `area_conhecimento_livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_conhecimento_livro` (
  `id_Area_Conhecimento` int(11) NOT NULL,
  `id_Livro` int(11) NOT NULL,
  PRIMARY KEY (`id_Area_Conhecimento`,`id_Livro`),
  KEY `livro_area_conhecimento_livro_fk` (`id_Livro`),
  CONSTRAINT `area_conhecimento_area_conhecimento_livro_fk` FOREIGN KEY (`id_Area_Conhecimento`) REFERENCES `area_conhecimento` (`id_Area_Conhecimento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `livro_area_conhecimento_livro_fk` FOREIGN KEY (`id_Livro`) REFERENCES `livro` (`id_Livro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_conhecimento_livro`
--

LOCK TABLES `area_conhecimento_livro` WRITE;
/*!40000 ALTER TABLE `area_conhecimento_livro` DISABLE KEYS */;
INSERT INTO `area_conhecimento_livro` VALUES (2,1),(2,2),(4,2),(1,3),(5,5);
/*!40000 ALTER TABLE `area_conhecimento_livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autor` (
  `id_Autor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_Autor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'maria'),(2,'antonio'),(3,'paulo'),(4,'marcos'),(5,'marcio');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor_livro`
--

DROP TABLE IF EXISTS `autor_livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autor_livro` (
  `id_Autor` int(11) NOT NULL,
  `id_Livro` int(11) NOT NULL,
  PRIMARY KEY (`id_Autor`,`id_Livro`),
  KEY `livro_autor_livro_fk` (`id_Livro`),
  CONSTRAINT `autor_autor_livro_fk` FOREIGN KEY (`id_Autor`) REFERENCES `autor` (`id_Autor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `livro_autor_livro_fk` FOREIGN KEY (`id_Livro`) REFERENCES `livro` (`id_Livro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor_livro`
--

LOCK TABLES `autor_livro` WRITE;
/*!40000 ALTER TABLE `autor_livro` DISABLE KEYS */;
INSERT INTO `autor_livro` VALUES (1,1),(1,2),(2,3),(3,3),(1,5),(4,5);
/*!40000 ALTER TABLE `autor_livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bairro`
--

DROP TABLE IF EXISTS `bairro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bairro` (
  `id_Bairro` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `id_Cidade` int(11) NOT NULL,
  PRIMARY KEY (`id_Bairro`),
  KEY `cidade_bairro_fk` (`id_Cidade`),
  CONSTRAINT `cidade_bairro_fk` FOREIGN KEY (`id_Cidade`) REFERENCES `cidade` (`id_Cidade`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bairro`
--

LOCK TABLES `bairro` WRITE;
/*!40000 ALTER TABLE `bairro` DISABLE KEYS */;
INSERT INTO `bairro` VALUES (1,'asa norte',1),(2,'asa sul',1),(3,'p sul',1),(4,'avenida sp',4),(5,'quadra 24',5);
/*!40000 ALTER TABLE `bairro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidade` (
  `id_Cidade` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `id_UF` int(11) NOT NULL,
  PRIMARY KEY (`id_Cidade`),
  KEY `uf_cidade_fk` (`id_UF`),
  CONSTRAINT `uf_cidade_fk` FOREIGN KEY (`id_UF`) REFERENCES `uf` (`id_UF`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1,'brasilia',1),(2,'taguatinga',1),(3,'ceilandia',1),(4,'sao paulo',2),(5,'vazante',5);
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cor_pele`
--

DROP TABLE IF EXISTS `cor_pele`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cor_pele` (
  `id_Cor_Pele` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id_Cor_Pele`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cor_pele`
--

LOCK TABLES `cor_pele` WRITE;
/*!40000 ALTER TABLE `cor_pele` DISABLE KEYS */;
INSERT INTO `cor_pele` VALUES (1,'amarelo'),(2,'pardo'),(3,'negro'),(4,'branco'),(5,'mulato');
/*!40000 ALTER TABLE `cor_pele` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependente`
--

DROP TABLE IF EXISTS `dependente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependente` (
  `id_Dependente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `id_Professor` int(11) DEFAULT NULL,
  `id_Funcionario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Dependente`),
  KEY `professor_depedente_fk` (`id_Professor`),
  KEY `funcionario_depedente_fk` (`id_Funcionario`),
  CONSTRAINT `funcionario_depedente_fk` FOREIGN KEY (`id_Funcionario`) REFERENCES `funcionario` (`id_Funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `professor_depedente_fk` FOREIGN KEY (`id_Professor`) REFERENCES `professor` (`id_Professor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependente`
--

LOCK TABLES `dependente` WRITE;
/*!40000 ALTER TABLE `dependente` DISABLE KEYS */;
INSERT INTO `dependente` VALUES (1,'flavio',3,NULL),(2,'italo',2,NULL),(3,'barbara',5,NULL),(4,'alexandra',1,NULL),(5,'eduardo',4,NULL),(6,'natalia',NULL,3),(7,'vitoria',NULL,2),(8,'carlos',NULL,5),(9,'vitor',NULL,1),(10,'guilherme',NULL,4);
/*!40000 ALTER TABLE `dependente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editora`
--

DROP TABLE IF EXISTS `editora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editora` (
  `id_Editora` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_Editora`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editora`
--

LOCK TABLES `editora` WRITE;
/*!40000 ALTER TABLE `editora` DISABLE KEYS */;
INSERT INTO `editora` VALUES (1,'unb'),(2,'moderna'),(3,'campus'),(4,'novatec'),(5,'pearson'),(6,'elsever');
/*!40000 ALTER TABLE `editora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email` (
  `id_Email` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `id_Aluno` int(11) DEFAULT NULL,
  `id_Professor` int(11) DEFAULT NULL,
  `id_Funcionario` int(11) DEFAULT NULL,
  `id_Tipo_Email` int(11) NOT NULL,
  PRIMARY KEY (`id_Email`),
  UNIQUE KEY `email_nome_UNIQUE` (`nome`),
  KEY `tipo_email_email_fk` (`id_Tipo_Email`),
  KEY `aluno_email_fk` (`id_Aluno`),
  KEY `professor_email_fk` (`id_Professor`),
  KEY `funcionario_email_fk` (`id_Funcionario`),
  CONSTRAINT `aluno_email_fk` FOREIGN KEY (`id_Aluno`) REFERENCES `aluno` (`id_Aluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `funcionario_email_fk` FOREIGN KEY (`id_Funcionario`) REFERENCES `funcionario` (`id_Funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `professor_email_fk` FOREIGN KEY (`id_Professor`) REFERENCES `professor` (`id_Professor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tipo_email_email_fk` FOREIGN KEY (`id_Tipo_Email`) REFERENCES `tipo_email` (`id_Tipo_Email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES (1,'luan@gmail.com',1,NULL,NULL,1),(2,'jose@outlook.com',2,NULL,NULL,1),(3,'katia@hotmail.com',3,NULL,NULL,4),(4,'marcos@yahoo.com',4,NULL,NULL,5),(5,'alice@unb.com',5,NULL,NULL,2),(6,'caio@gmail.com',NULL,1,NULL,1),(7,'diego@outlook.com',NULL,2,NULL,1),(8,'maria@hotmail.com',NULL,3,NULL,4),(9,'mateus@yahoo.com',NULL,4,NULL,5),(10,'larissa@unb.com',NULL,5,NULL,2),(11,'lucas@gmail.com',NULL,NULL,1,1),(12,'leonado@outlook.com',NULL,NULL,2,1),(13,'julia@hotmail.com',NULL,NULL,3,4),(14,'glauco@yahoo.com',NULL,NULL,4,5),(15,'joana@unb.com',NULL,NULL,5,2);
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprestimo`
--

DROP TABLE IF EXISTS `emprestimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emprestimo` (
  `id_Emprestimo` int(11) NOT NULL AUTO_INCREMENT,
  `data_Emprestimo` date NOT NULL,
  `id_Aluno` int(11) DEFAULT NULL,
  `id_Professor` int(11) DEFAULT NULL,
  `id_Funcionario` int(11) NOT NULL,
  PRIMARY KEY (`id_Emprestimo`),
  KEY `aluno_emprestimo_fk` (`id_Aluno`),
  KEY `professor_emprestimo_fk` (`id_Professor`),
  KEY `funcionario_emprestimo_fk` (`id_Funcionario`),
  KEY `emprestimo_data_empretismo` (`data_Emprestimo`),
  CONSTRAINT `aluno_emprestimo_fk` FOREIGN KEY (`id_Aluno`) REFERENCES `aluno` (`id_Aluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `funcionario_emprestimo_fk` FOREIGN KEY (`id_Funcionario`) REFERENCES `funcionario` (`id_Funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `professor_emprestimo_fk` FOREIGN KEY (`id_Professor`) REFERENCES `professor` (`id_Professor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimo`
--

LOCK TABLES `emprestimo` WRITE;
/*!40000 ALTER TABLE `emprestimo` DISABLE KEYS */;
INSERT INTO `emprestimo` VALUES (1,'2018-11-18',1,NULL,3),(2,'2018-11-18',2,NULL,4),(3,'2018-11-18',3,NULL,1),(4,'2018-11-18',4,NULL,4),(5,'2018-11-18',5,NULL,2),(6,'2018-10-23',NULL,1,2),(7,'2018-10-23',NULL,2,1),(8,'2018-10-23',NULL,3,5),(9,'2018-10-23',NULL,4,3),(10,'2018-10-23',NULL,5,4);
/*!40000 ALTER TABLE `emprestimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `id_Endereco` int(11) NOT NULL AUTO_INCREMENT,
  `rua` varchar(50) NOT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `numero` int(11) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `id_Aluno` int(11) DEFAULT NULL,
  `id_Professor` int(11) DEFAULT NULL,
  `id_Funcionario` int(11) DEFAULT NULL,
  `id_Bairro` int(11) NOT NULL,
  `id_Tipo_Endereco` int(11) NOT NULL,
  PRIMARY KEY (`id_Endereco`),
  KEY `tipo_endereco_endereco_fk` (`id_Tipo_Endereco`),
  KEY `bairro_endereco_fk` (`id_Bairro`),
  KEY `aluno_endereco_fk` (`id_Aluno`),
  KEY `professor_endereco_fk` (`id_Professor`),
  KEY `funcionario_endereco_fk` (`id_Funcionario`),
  CONSTRAINT `aluno_endereco_fk` FOREIGN KEY (`id_Aluno`) REFERENCES `aluno` (`id_Aluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bairro_endereco_fk` FOREIGN KEY (`id_Bairro`) REFERENCES `bairro` (`id_Bairro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `funcionario_endereco_fk` FOREIGN KEY (`id_Funcionario`) REFERENCES `funcionario` (`id_Funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `professor_endereco_fk` FOREIGN KEY (`id_Professor`) REFERENCES `professor` (`id_Professor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tipo_endereco_endereco_fk` FOREIGN KEY (`id_Tipo_Endereco`) REFERENCES `tipo_endereco` (`id_Tipo_Endereco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'sqn 306',NULL,1,'70000',1,NULL,NULL,1,1),(2,'sqn 305',NULL,3,'70001',2,NULL,NULL,1,3),(3,'qnp 18',NULL,2,'70003',3,NULL,NULL,3,4),(4,'sqs 10',NULL,5,'70005',2,NULL,NULL,4,2),(5,'sqs 306',NULL,1,'70000',5,NULL,NULL,3,4),(6,'sqn 307',NULL,1,'70002',NULL,1,NULL,1,1),(7,'sqn 302',NULL,3,'70009',NULL,2,NULL,1,3),(8,'qnp 14',NULL,2,'70002',NULL,3,NULL,3,4),(9,'sqs 12',NULL,5,'70007',NULL,2,NULL,4,2),(10,'sqs 308',NULL,1,'70009',NULL,5,NULL,3,4),(11,'sqn 300',NULL,1,'70010',NULL,NULL,1,1,1),(12,'sqn 306',NULL,3,'70011',NULL,NULL,2,1,3),(13,'qnp 19',NULL,2,'70013',NULL,NULL,3,3,4),(14,'sqs 14',NULL,5,'70016',NULL,NULL,2,4,2),(15,'sqs 307',NULL,1,'70018',NULL,NULL,5,3,4);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_civil`
--

DROP TABLE IF EXISTS `estado_civil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_civil` (
  `id_Estado_Civil` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id_Estado_Civil`),
  UNIQUE KEY `estado_descricao_UNIQUE` (`descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_civil`
--

LOCK TABLES `estado_civil` WRITE;
/*!40000 ALTER TABLE `estado_civil` DISABLE KEYS */;
INSERT INTO `estado_civil` VALUES (1,'casado'),(4,'divociado'),(5,'outros'),(2,'solteiro'),(3,'viuvo');
/*!40000 ALTER TABLE `estado_civil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `id_Funcionario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `matricula` varchar(20) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `id_Sexo` int(11) NOT NULL,
  `id_Cor_Pele` int(11) NOT NULL,
  `id_Estado_Civil` int(11) NOT NULL,
  `id_Naturalidade` int(11) NOT NULL,
  PRIMARY KEY (`id_Funcionario`),
  KEY `cor_pele_funcionario_fk` (`id_Cor_Pele`),
  KEY `sexo_funcionario_fk` (`id_Sexo`),
  KEY `estado_civil_funcionario_fk` (`id_Estado_Civil`),
  KEY `naturalidade_funcionario_fk` (`id_Naturalidade`),
  CONSTRAINT `cor_pele_funcionario_fk` FOREIGN KEY (`id_Cor_Pele`) REFERENCES `cor_pele` (`id_Cor_Pele`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `estado_civil_funcionario_fk` FOREIGN KEY (`id_Estado_Civil`) REFERENCES `estado_civil` (`id_Estado_Civil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `naturalidade_funcionario_fk` FOREIGN KEY (`id_Naturalidade`) REFERENCES `naturalidade` (`id_Naturalidade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sexo_funcionario_fk` FOREIGN KEY (`id_Sexo`) REFERENCES `sexo` (`id_Sexo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'lucas','1','11111111111',1,2,2,1),(2,'leonado','2','22222222222',1,3,3,2),(3,'julia','3','33333333333',2,3,1,4),(4,'glauco','2','22222222222',1,1,3,3),(5,'joana','2','22222222222',2,3,2,1);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habilidade`
--

DROP TABLE IF EXISTS `habilidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habilidade` (
  `id_Habilidade` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id_Habilidade`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidade`
--

LOCK TABLES `habilidade` WRITE;
/*!40000 ALTER TABLE `habilidade` DISABLE KEYS */;
INSERT INTO `habilidade` VALUES (1,'manutenção'),(2,'contador'),(3,'organização'),(4,'comunicação'),(5,'descrição');
/*!40000 ALTER TABLE `habilidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habilidade_funcionario`
--

DROP TABLE IF EXISTS `habilidade_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habilidade_funcionario` (
  `id_Habilidade` int(11) NOT NULL,
  `id_Funcionario` int(11) NOT NULL,
  PRIMARY KEY (`id_Habilidade`,`id_Funcionario`),
  KEY `funcionario_habilidade_funcionario_fk` (`id_Funcionario`),
  CONSTRAINT `funcionario_habilidade_funcionario_fk` FOREIGN KEY (`id_Funcionario`) REFERENCES `funcionario` (`id_Funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `habilidade_habilidade_funcionario_fk` FOREIGN KEY (`id_Habilidade`) REFERENCES `habilidade` (`id_Habilidade`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidade_funcionario`
--

LOCK TABLES `habilidade_funcionario` WRITE;
/*!40000 ALTER TABLE `habilidade_funcionario` DISABLE KEYS */;
INSERT INTO `habilidade_funcionario` VALUES (1,1),(4,2),(1,3),(2,4),(3,5);
/*!40000 ALTER TABLE `habilidade_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livro` (
  `id_Livro` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `isbn` int(11) NOT NULL,
  `ano_Edicao` date NOT NULL,
  `numero_Pagina` int(11) NOT NULL,
  `id_Editora` int(11) NOT NULL,
  PRIMARY KEY (`id_Livro`),
  KEY `editora_livro_fk` (`id_Editora`),
  KEY `livro_titulo` (`titulo`),
  CONSTRAINT `editora_livro_fk` FOREIGN KEY (`id_Editora`) REFERENCES `editora` (`id_Editora`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES (1,'computacao basica',123,'2018-11-08',300,1),(2,'computacao experimental',456,'2018-11-08',300,2),(3,'java basico',789,'2018-11-08',300,1),(4,'linguagem C',111,'2018-11-08',300,4),(5,'linguagem C++',222,'2018-11-08',300,3);
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro_emprestimo`
--

DROP TABLE IF EXISTS `livro_emprestimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livro_emprestimo` (
  `id_Livro` int(11) NOT NULL,
  `id_Emprestimo` int(11) NOT NULL,
  `data_Entrega` date NOT NULL,
  `data_Devolucao` date DEFAULT NULL,
  PRIMARY KEY (`id_Livro`,`id_Emprestimo`),
  KEY `emprestimo_livroemprestimo_fk` (`id_Emprestimo`),
  CONSTRAINT `emprestimo_livroemprestimo_fk` FOREIGN KEY (`id_Emprestimo`) REFERENCES `emprestimo` (`id_Emprestimo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `livro_livroemprestimo_fk` FOREIGN KEY (`id_Livro`) REFERENCES `livro` (`id_Livro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro_emprestimo`
--

LOCK TABLES `livro_emprestimo` WRITE;
/*!40000 ALTER TABLE `livro_emprestimo` DISABLE KEYS */;
INSERT INTO `livro_emprestimo` VALUES (1,3,'2018-11-24','2019-01-11'),(1,5,'2018-09-22','2019-01-13'),(2,1,'2018-10-23','2019-01-10'),(4,2,'2018-12-26','2019-01-12'),(5,2,'2018-10-19','2019-01-14');
/*!40000 ALTER TABLE `livro_emprestimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `naturalidade`
--

DROP TABLE IF EXISTS `naturalidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `naturalidade` (
  `id_Naturalidade` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `id_UF` int(11) NOT NULL,
  PRIMARY KEY (`id_Naturalidade`),
  KEY `uf_naturalidade_fk` (`id_UF`),
  CONSTRAINT `uf_naturalidade_fk` FOREIGN KEY (`id_UF`) REFERENCES `uf` (`id_UF`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `naturalidade`
--

LOCK TABLES `naturalidade` WRITE;
/*!40000 ALTER TABLE `naturalidade` DISABLE KEYS */;
INSERT INTO `naturalidade` VALUES (1,'brasiliense',1),(2,'paulista',2),(3,'carioca',3),(4,'goiano',4),(5,'mineiro',5);
/*!40000 ALTER TABLE `naturalidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagamento` (
  `id_Livro` int(11) NOT NULL,
  `id_Emprestimo` int(11) NOT NULL,
  `data_Pagamento` date NOT NULL,
  `valor_Atraso` double NOT NULL,
  `valor_Pago` double NOT NULL,
  `hora_Pagamento` time NOT NULL,
  PRIMARY KEY (`id_Livro`,`id_Emprestimo`),
  CONSTRAINT `livroemprestimo_pagamento_fk` FOREIGN KEY (`id_Livro`, `id_Emprestimo`) REFERENCES `livro_emprestimo` (`id_Livro`, `id_Emprestimo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,3,'2019-02-11',12,25,'13:00:00'),(1,5,'2019-01-17',20,36,'10:00:00'),(2,1,'2019-03-10',10,20,'16:00:00'),(4,2,'2019-02-06',8,15,'15:00:00'),(5,2,'2019-01-19',13,26,'19:00:00');
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `id_Pais` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id_Pais`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Brasil'),(2,'Estado Unidos'),(3,'Argetina'),(4,'Paraguai'),(5,'Bolivia');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor` (
  `id_Professor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `matricula` varchar(20) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `carga_Horaria` time NOT NULL,
  `id_Sexo` int(11) NOT NULL,
  `id_Cor_Pele` int(11) NOT NULL,
  `id_Estado_Civil` int(11) NOT NULL,
  `id_Naturalidade` int(11) NOT NULL,
  PRIMARY KEY (`id_Professor`),
  KEY `cor_pele_professor_fk` (`id_Cor_Pele`),
  KEY `sexo_professor_fk` (`id_Sexo`),
  KEY `estado_civil_professor_fk` (`id_Estado_Civil`),
  KEY `naturalidade_professor_fk` (`id_Naturalidade`),
  KEY `professor_nome` (`nome`),
  CONSTRAINT `cor_pele_professor_fk` FOREIGN KEY (`id_Cor_Pele`) REFERENCES `cor_pele` (`id_Cor_Pele`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `estado_civil_professor_fk` FOREIGN KEY (`id_Estado_Civil`) REFERENCES `estado_civil` (`id_Estado_Civil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `naturalidade_professor_fk` FOREIGN KEY (`id_Naturalidade`) REFERENCES `naturalidade` (`id_Naturalidade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sexo_professor_fk` FOREIGN KEY (`id_Sexo`) REFERENCES `sexo` (`id_Sexo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,'caio','1','11111111111','02:00:00',1,2,2,1),(2,'diego','2','22222222222','04:00:00',1,3,3,2),(3,'maria','3','33333333333','06:00:00',2,3,1,4),(4,'mateus','2','22222222222','08:00:00',1,1,3,3),(5,'larissa','2','22222222222','10:00:00',2,3,2,1);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_titulacao`
--

DROP TABLE IF EXISTS `professor_titulacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor_titulacao` (
  `id_Titulacao` int(11) NOT NULL,
  `id_Professor` int(11) NOT NULL,
  `ano` date NOT NULL,
  PRIMARY KEY (`id_Titulacao`,`id_Professor`),
  KEY `professor_professor_titulacao_fk` (`id_Professor`),
  CONSTRAINT `professor_professor_titulacao_fk` FOREIGN KEY (`id_Professor`) REFERENCES `professor` (`id_Professor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `titulacao_professor_titulacao_fk` FOREIGN KEY (`id_Titulacao`) REFERENCES `titulacao` (`id_Titulacao`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_titulacao`
--

LOCK TABLES `professor_titulacao` WRITE;
/*!40000 ALTER TABLE `professor_titulacao` DISABLE KEYS */;
INSERT INTO `professor_titulacao` VALUES (1,2,'2009-02-21'),(1,3,'2000-03-15'),(2,1,'2010-01-10'),(3,5,'2005-02-20'),(5,4,'2006-01-14');
/*!40000 ALTER TABLE `professor_titulacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva` (
  `id_Reserva` int(11) NOT NULL AUTO_INCREMENT,
  `data_Reserva` date NOT NULL,
  `id_Aluno` int(11) DEFAULT NULL,
  `id_Professor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Reserva`),
  KEY `aluno_reserva_fk` (`id_Aluno`),
  KEY `professor_reserva_fk` (`id_Professor`),
  CONSTRAINT `aluno_reserva_fk` FOREIGN KEY (`id_Aluno`) REFERENCES `aluno` (`id_Aluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `professor_reserva_fk` FOREIGN KEY (`id_Professor`) REFERENCES `professor` (`id_Professor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,'2018-08-21',1,NULL),(2,'2018-08-21',4,NULL),(3,'2018-08-21',2,NULL),(4,'2018-08-21',5,NULL),(5,'2018-08-21',2,NULL),(6,'2018-08-21',NULL,3),(7,'2018-08-21',NULL,1),(8,'2018-08-21',NULL,5),(9,'2018-08-21',NULL,2),(10,'2018-08-21',NULL,2);
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva_livro`
--

DROP TABLE IF EXISTS `reserva_livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva_livro` (
  `id_Livro` int(11) NOT NULL,
  `id_Reserva` int(11) NOT NULL,
  PRIMARY KEY (`id_Livro`,`id_Reserva`),
  KEY `reserva_reserva_livro_fk` (`id_Reserva`),
  CONSTRAINT `livro_reserva_livro_fk` FOREIGN KEY (`id_Livro`) REFERENCES `livro` (`id_Livro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `reserva_reserva_livro_fk` FOREIGN KEY (`id_Reserva`) REFERENCES `reserva` (`id_Reserva`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva_livro`
--

LOCK TABLES `reserva_livro` WRITE;
/*!40000 ALTER TABLE `reserva_livro` DISABLE KEYS */;
INSERT INTO `reserva_livro` VALUES (4,1),(5,2),(1,4),(2,4),(3,5);
/*!40000 ALTER TABLE `reserva_livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexo`
--

DROP TABLE IF EXISTS `sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sexo` (
  `id_Sexo` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(10) NOT NULL,
  PRIMARY KEY (`id_Sexo`),
  UNIQUE KEY `sexo_descricao_UNIQUE` (`descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexo`
--

LOCK TABLES `sexo` WRITE;
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` VALUES (2,'feminino'),(1,'masculino'),(3,'outros');
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone`
--

DROP TABLE IF EXISTS `telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefone` (
  `id_Telefone` int(11) NOT NULL AUTO_INCREMENT,
  `ddd` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `id_Aluno` int(11) DEFAULT NULL,
  `id_Professor` int(11) DEFAULT NULL,
  `id_Funcionario` int(11) DEFAULT NULL,
  `id_Tipo_Telefone` int(11) NOT NULL,
  PRIMARY KEY (`id_Telefone`),
  KEY `tipo_telefone_telefone_fk` (`id_Tipo_Telefone`),
  KEY `aluno_telefone_fk` (`id_Aluno`),
  KEY `professor_telefone_fk` (`id_Professor`),
  KEY `funcionario_telefone_fk` (`id_Funcionario`),
  CONSTRAINT `aluno_telefone_fk` FOREIGN KEY (`id_Aluno`) REFERENCES `aluno` (`id_Aluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `funcionario_telefone_fk` FOREIGN KEY (`id_Funcionario`) REFERENCES `funcionario` (`id_Funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `professor_telefone_fk` FOREIGN KEY (`id_Professor`) REFERENCES `professor` (`id_Professor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tipo_telefone_telefone_fk` FOREIGN KEY (`id_Tipo_Telefone`) REFERENCES `tipo_telefone` (`id_Tipo_Telefone`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone`
--

LOCK TABLES `telefone` WRITE;
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
INSERT INTO `telefone` VALUES (1,61,12345,1,NULL,NULL,1),(2,61,67890,1,NULL,NULL,2),(3,61,11111,3,NULL,NULL,1),(4,11,22222,4,NULL,NULL,2),(5,21,33333,5,NULL,NULL,1),(6,61,41235,NULL,1,NULL,1),(7,61,75634,NULL,1,NULL,2),(8,61,88888,NULL,3,NULL,1),(9,11,42568,NULL,4,NULL,2),(10,21,99999,NULL,5,NULL,1),(11,61,55555,NULL,NULL,1,1),(12,61,17987,NULL,NULL,1,2),(13,61,32156,NULL,NULL,3,1),(14,11,77777,NULL,NULL,4,2),(15,21,66666,NULL,NULL,5,1);
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_email`
--

DROP TABLE IF EXISTS `tipo_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_email` (
  `id_Tipo_Email` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id_Tipo_Email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_email`
--

LOCK TABLES `tipo_email` WRITE;
/*!40000 ALTER TABLE `tipo_email` DISABLE KEYS */;
INSERT INTO `tipo_email` VALUES (1,'pessoal'),(2,'corporativo'),(3,'webemail'),(4,'serviço'),(5,'domínio próprio');
/*!40000 ALTER TABLE `tipo_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_endereco`
--

DROP TABLE IF EXISTS `tipo_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_endereco` (
  `id_Tipo_Endereco` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id_Tipo_Endereco`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_endereco`
--

LOCK TABLES `tipo_endereco` WRITE;
/*!40000 ALTER TABLE `tipo_endereco` DISABLE KEYS */;
INSERT INTO `tipo_endereco` VALUES (1,'quadra'),(2,'rua'),(3,'avenida'),(4,'lote'),(5,'outros');
/*!40000 ALTER TABLE `tipo_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_telefone`
--

DROP TABLE IF EXISTS `tipo_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_telefone` (
  `id_Tipo_Telefone` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id_Tipo_Telefone`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_telefone`
--

LOCK TABLES `tipo_telefone` WRITE;
/*!40000 ALTER TABLE `tipo_telefone` DISABLE KEYS */;
INSERT INTO `tipo_telefone` VALUES (1,'celular'),(2,'fixo');
/*!40000 ALTER TABLE `tipo_telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulacao`
--

DROP TABLE IF EXISTS `titulacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titulacao` (
  `id_Titulacao` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id_Titulacao`),
  UNIQUE KEY `titulacao_descricao_UNIQUE` (`descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulacao`
--

LOCK TABLES `titulacao` WRITE;
/*!40000 ALTER TABLE `titulacao` DISABLE KEYS */;
INSERT INTO `titulacao` VALUES (2,'doutorado'),(3,'especialização'),(4,'mba'),(1,'mestrado'),(5,'mestrado profissional');
/*!40000 ALTER TABLE `titulacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uf`
--

DROP TABLE IF EXISTS `uf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uf` (
  `id_UF` int(11) NOT NULL AUTO_INCREMENT,
  `sigla` varchar(20) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `id_Pais` int(11) NOT NULL,
  PRIMARY KEY (`id_UF`),
  KEY `pais_uf_fk` (`id_Pais`),
  CONSTRAINT `pais_uf_fk` FOREIGN KEY (`id_Pais`) REFERENCES `pais` (`id_Pais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uf`
--

LOCK TABLES `uf` WRITE;
/*!40000 ALTER TABLE `uf` DISABLE KEYS */;
INSERT INTO `uf` VALUES (1,'df','distrito federal',1),(2,'sp','sao paulo',1),(3,'rj','rio de janeiro',1),(4,'go','goias',1),(5,'bh','belo horihonte',1);
/*!40000 ALTER TABLE `uf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'biblioteca'
--

--
-- Dumping routines for database 'biblioteca'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-13 22:13:18
