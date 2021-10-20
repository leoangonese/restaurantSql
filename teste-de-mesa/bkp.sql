-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.21-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for restaurante
CREATE DATABASE IF NOT EXISTS `restaurante` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `restaurante`;

-- Dumping structure for table restaurante.abastecedor
CREATE TABLE IF NOT EXISTS `abastecedor` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `funcao` varchar(50) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table restaurante.abastecedor: ~2 rows (approximately)
/*!40000 ALTER TABLE `abastecedor` DISABLE KEYS */;
INSERT INTO `abastecedor` (`id`, `nome`, `funcao`, `cpf`) VALUES
	(1, 'Neygulas', 'abastecer comidas', '12195084030'),
	(2, 'Guik', 'abastecer bebidas', '12154084030');
/*!40000 ALTER TABLE `abastecedor` ENABLE KEYS */;

-- Dumping structure for table restaurante.atendente
CREATE TABLE IF NOT EXISTS `atendente` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `funcao` varchar(50) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table restaurante.atendente: ~2 rows (approximately)
/*!40000 ALTER TABLE `atendente` DISABLE KEYS */;
INSERT INTO `atendente` (`id`, `nome`, `funcao`, `cpf`) VALUES
	(1, 'Guto', 'atender clientes', '12154583030'),
	(2, 'Gui', 'atender clientes', '12333583030');
/*!40000 ALTER TABLE `atendente` ENABLE KEYS */;

-- Dumping structure for table restaurante.bebidas
CREATE TABLE IF NOT EXISTS `bebidas` (
  `id` int(11) NOT NULL,
  `refrigerante` int(11) DEFAULT NULL,
  `suco` int(11) DEFAULT NULL,
  `agua` int(11) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table restaurante.bebidas: ~2 rows (approximately)
/*!40000 ALTER TABLE `bebidas` DISABLE KEYS */;
INSERT INTO `bebidas` (`id`, `refrigerante`, `suco`, `agua`, `nome`) VALUES
	(1, 4, 2, 4, 'nome da bebida'),
	(2, 5, 4, 2, 'nome da bebida');
/*!40000 ALTER TABLE `bebidas` ENABLE KEYS */;

-- Dumping structure for table restaurante.caixa
CREATE TABLE IF NOT EXISTS `caixa` (
  `id` int(11) NOT NULL,
  `idTipoFuncionario` int(11) DEFAULT NULL,
  `idComanda` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_caixa_2` (`idComanda`),
  KEY `FK_caixa_3` (`idTipoFuncionario`),
  CONSTRAINT `FK_caixa_2` FOREIGN KEY (`idComanda`) REFERENCES `comanda` (`id`),
  CONSTRAINT `FK_caixa_3` FOREIGN KEY (`idTipoFuncionario`) REFERENCES `tipofuncionario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table restaurante.caixa: ~2 rows (approximately)
/*!40000 ALTER TABLE `caixa` DISABLE KEYS */;
INSERT INTO `caixa` (`id`, `idTipoFuncionario`, `idComanda`) VALUES
	(1, 1, 1),
	(2, 2, 2);
/*!40000 ALTER TABLE `caixa` ENABLE KEYS */;

-- Dumping structure for table restaurante.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table restaurante.cliente: ~2 rows (approximately)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`id`, `nome`, `cpf`) VALUES
	(1, 'leo lindo', '11586933035'),
	(2, 'Matheus fogo', '42478314029');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Dumping structure for table restaurante.comanda
CREATE TABLE IF NOT EXISTS `comanda` (
  `id` int(11) NOT NULL,
  `idPedido` int(11) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `idMesa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_comanda_2` (`idPedido`),
  KEY `FK_comanda_3` (`idCliente`),
  KEY `FK_comanda_4` (`idMesa`),
  CONSTRAINT `FK_comanda_2` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`id`),
  CONSTRAINT `FK_comanda_3` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `FK_comanda_4` FOREIGN KEY (`idMesa`) REFERENCES `mesa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table restaurante.comanda: ~2 rows (approximately)
/*!40000 ALTER TABLE `comanda` DISABLE KEYS */;
INSERT INTO `comanda` (`id`, `idPedido`, `idCliente`, `valor`, `idMesa`) VALUES
	(1, 1, 1, 100, NULL),
	(2, 2, 2, 200, NULL);
/*!40000 ALTER TABLE `comanda` ENABLE KEYS */;

-- Dumping structure for table restaurante.comidas
CREATE TABLE IF NOT EXISTS `comidas` (
  `id` int(11) NOT NULL,
  `carnes_` int(11) DEFAULT NULL,
  `saladas` int(11) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table restaurante.comidas: ~2 rows (approximately)
/*!40000 ALTER TABLE `comidas` DISABLE KEYS */;
INSERT INTO `comidas` (`id`, `carnes_`, `saladas`, `nome`) VALUES
	(1, 3, 3, 'nome da comida'),
	(2, 5, 4, 'nome da comida');
/*!40000 ALTER TABLE `comidas` ENABLE KEYS */;

-- Dumping structure for table restaurante.cozinha
CREATE TABLE IF NOT EXISTS `cozinha` (
  `id` int(11) NOT NULL,
  `idComanda` int(11) DEFAULT NULL,
  `idEstoque` int(11) DEFAULT NULL,
  `idTipoFuncionario` int(11) DEFAULT NULL,
  `idBebida` int(11) DEFAULT NULL,
  `idComida` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cozinha_2` (`idComanda`),
  KEY `FK_cozinha_4` (`idTipoFuncionario`),
  KEY `FK_cozinha_5` (`idComida`),
  KEY `FK_cozinha_6` (`idBebida`),
  KEY `FK_cozinha_7` (`idEstoque`),
  CONSTRAINT `FK_cozinha_2` FOREIGN KEY (`idComanda`) REFERENCES `comanda` (`id`),
  CONSTRAINT `FK_cozinha_4` FOREIGN KEY (`idTipoFuncionario`) REFERENCES `tipofuncionario` (`id`),
  CONSTRAINT `FK_cozinha_5` FOREIGN KEY (`idComida`) REFERENCES `comidas` (`id`),
  CONSTRAINT `FK_cozinha_6` FOREIGN KEY (`idBebida`) REFERENCES `bebidas` (`id`),
  CONSTRAINT `FK_cozinha_7` FOREIGN KEY (`idEstoque`) REFERENCES `restaurante_estoque` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table restaurante.cozinha: ~2 rows (approximately)
/*!40000 ALTER TABLE `cozinha` DISABLE KEYS */;
INSERT INTO `cozinha` (`id`, `idComanda`, `idEstoque`, `idTipoFuncionario`, `idBebida`, `idComida`) VALUES
	(1, 1, 2, 3, 1, 2),
	(2, 2, 1, 4, 2, 1);
/*!40000 ALTER TABLE `cozinha` ENABLE KEYS */;

-- Dumping structure for table restaurante.cozinheiro
CREATE TABLE IF NOT EXISTS `cozinheiro` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `funcao` varchar(50) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table restaurante.cozinheiro: ~2 rows (approximately)
/*!40000 ALTER TABLE `cozinheiro` DISABLE KEYS */;
INSERT INTO `cozinheiro` (`id`, `nome`, `funcao`, `cpf`) VALUES
	(1, 'jorje', 'fazer comida', '00073468088'),
	(2, 'jorge', 'fazer comida', '00073468033');
/*!40000 ALTER TABLE `cozinheiro` ENABLE KEYS */;

-- Dumping structure for table restaurante.faxineiro
CREATE TABLE IF NOT EXISTS `faxineiro` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `funcao` varchar(50) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table restaurante.faxineiro: ~2 rows (approximately)
/*!40000 ALTER TABLE `faxineiro` DISABLE KEYS */;
INSERT INTO `faxineiro` (`id`, `nome`, `funcao`, `cpf`) VALUES
	(1, 'claudio', 'limpar mesas', '35804472038'),
	(2, 'claudia', 'limpar cozinha', '35804472033');
/*!40000 ALTER TABLE `faxineiro` ENABLE KEYS */;

-- Dumping structure for table restaurante.fornecedor
CREATE TABLE IF NOT EXISTS `fornecedor` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `cnpj` varchar(14) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `local` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table restaurante.fornecedor: ~2 rows (approximately)
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` (`id`, `nome`, `cnpj`, `valor`, `local`) VALUES
	(1, 'fornecedor barato', '36341897000164', 1000, 'canoas'),
	(2, 'fornecedor caro', '36341897000133', 1000, 'porto alegre');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;

-- Dumping structure for table restaurante.funcionario
CREATE TABLE IF NOT EXISTS `funcionario` (
  `id` int(11) NOT NULL,
  `idTipoFuncionario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_funcionario_2` (`idTipoFuncionario`),
  CONSTRAINT `FK_funcionario_2` FOREIGN KEY (`idTipoFuncionario`) REFERENCES `tipofuncionario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table restaurante.funcionario: ~2 rows (approximately)
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` (`id`, `idTipoFuncionario`) VALUES
	(1, 1),
	(2, 6);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;

-- Dumping structure for table restaurante.garcom
CREATE TABLE IF NOT EXISTS `garcom` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `funcao` varchar(50) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table restaurante.garcom: ~2 rows (approximately)
/*!40000 ALTER TABLE `garcom` DISABLE KEYS */;
INSERT INTO `garcom` (`id`, `nome`, `funcao`, `cpf`) VALUES
	(1, 'carlota', 'levar bebidas', '99904472038'),
	(2, 'laura', 'levar comidas', '99904472222');
/*!40000 ALTER TABLE `garcom` ENABLE KEYS */;

-- Dumping structure for table restaurante.mesa
CREATE TABLE IF NOT EXISTS `mesa` (
  `id` int(11) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `idComanda` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_mesa_2` (`idComanda`),
  CONSTRAINT `FK_mesa_2` FOREIGN KEY (`idComanda`) REFERENCES `comanda` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table restaurante.mesa: ~2 rows (approximately)
/*!40000 ALTER TABLE `mesa` DISABLE KEYS */;
INSERT INTO `mesa` (`id`, `numero`, `idComanda`) VALUES
	(1, 54, 1),
	(2, 43, 2);
/*!40000 ALTER TABLE `mesa` ENABLE KEYS */;

-- Dumping structure for table restaurante.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int(11) NOT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `descricaoPedido` varchar(60) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `idEstoque` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pedido_2` (`idCliente`),
  KEY `FK_pedido_3` (`idEstoque`),
  CONSTRAINT `FK_pedido_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `FK_pedido_3` FOREIGN KEY (`idEstoque`) REFERENCES `restaurante_estoque` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table restaurante.pedido: ~2 rows (approximately)
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` (`id`, `idCliente`, `descricaoPedido`, `valor`, `idEstoque`) VALUES
	(1, 1, 'frutos do mar', 100, 1),
	(2, 2, 'refrigerante', 10, 2);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

-- Dumping structure for table restaurante.restaurante_estoque
CREATE TABLE IF NOT EXISTS `restaurante_estoque` (
  `nome` varchar(50) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `local` varchar(50) DEFAULT NULL,
  `idEstoque` int(11) DEFAULT NULL,
  `idBebidas` int(11) DEFAULT NULL,
  `idComidas` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_restaurante_estoque_2` (`idBebidas`),
  KEY `FK_restaurante_estoque_3` (`idComidas`),
  CONSTRAINT `FK_restaurante_estoque_2` FOREIGN KEY (`idBebidas`) REFERENCES `bebidas` (`id`),
  CONSTRAINT `FK_restaurante_estoque_3` FOREIGN KEY (`idComidas`) REFERENCES `comidas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table restaurante.restaurante_estoque: ~2 rows (approximately)
/*!40000 ALTER TABLE `restaurante_estoque` DISABLE KEYS */;
INSERT INTO `restaurante_estoque` (`nome`, `id`, `local`, `idEstoque`, `idBebidas`, `idComidas`) VALUES
	('estoque1', 1, 'canoas', 1, 1, 2),
	('estoque2', 2, 'canoas', 2, 2, 1);
/*!40000 ALTER TABLE `restaurante_estoque` ENABLE KEYS */;

-- Dumping structure for table restaurante.tipofuncionario
CREATE TABLE IF NOT EXISTS `tipofuncionario` (
  `id` int(11) NOT NULL,
  `salario` double DEFAULT NULL,
  `idCozinheiro` int(11) DEFAULT NULL,
  `idAtendente` int(11) DEFAULT NULL,
  `idFaxineiro` int(11) DEFAULT NULL,
  `idGarcom` int(11) DEFAULT NULL,
  `idAbastecedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tipoFuncionario_2` (`idCozinheiro`),
  KEY `FK_tipoFuncionario_3` (`idAtendente`),
  KEY `FK_tipoFuncionario_4` (`idFaxineiro`),
  KEY `FK_tipoFuncionario_5` (`idAbastecedor`),
  KEY `FK_tipoFuncionario_6` (`idGarcom`),
  CONSTRAINT `FK_tipoFuncionario_2` FOREIGN KEY (`idCozinheiro`) REFERENCES `cozinheiro` (`id`),
  CONSTRAINT `FK_tipoFuncionario_3` FOREIGN KEY (`idAtendente`) REFERENCES `atendente` (`id`),
  CONSTRAINT `FK_tipoFuncionario_4` FOREIGN KEY (`idFaxineiro`) REFERENCES `faxineiro` (`id`),
  CONSTRAINT `FK_tipoFuncionario_5` FOREIGN KEY (`idAbastecedor`) REFERENCES `abastecedor` (`id`),
  CONSTRAINT `FK_tipoFuncionario_6` FOREIGN KEY (`idGarcom`) REFERENCES `garcom` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table restaurante.tipofuncionario: ~10 rows (approximately)
/*!40000 ALTER TABLE `tipofuncionario` DISABLE KEYS */;
INSERT INTO `tipofuncionario` (`id`, `salario`, `idCozinheiro`, `idAtendente`, `idFaxineiro`, `idGarcom`, `idAbastecedor`) VALUES
	(1, 1000, NULL, 2, NULL, NULL, NULL),
	(2, 1000, NULL, 1, NULL, NULL, NULL),
	(3, 1000, 1, NULL, NULL, NULL, NULL),
	(4, 1000, 2, NULL, NULL, NULL, NULL),
	(5, 1000, NULL, NULL, 2, NULL, NULL),
	(6, 1000, NULL, NULL, 1, NULL, NULL),
	(7, 1000, NULL, NULL, NULL, 2, NULL),
	(8, 1000, NULL, NULL, NULL, 1, NULL),
	(9, 1000, NULL, NULL, NULL, NULL, 2),
	(10, 1000, NULL, NULL, NULL, NULL, 1);
/*!40000 ALTER TABLE `tipofuncionario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
