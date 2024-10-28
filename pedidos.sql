-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.4.3 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para pedidos
CREATE DATABASE IF NOT EXISTS `pedidos` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pedidos`;

-- Copiando estrutura para tabela pedidos.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela pedidos.clientes: 20 rows
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`codigo`, `nome`, `cidade`, `uf`) VALUES
	(1, 'João Silva', 'São Paulo', 'SP'),
	(2, 'Maria Oliveira', 'Rio de Janeiro', 'RJ'),
	(3, 'Carlos Pereira', 'Belo Horizonte', 'MG'),
	(4, 'Ana Costa', 'Curitiba', 'PR'),
	(5, 'Pedro Souza', 'Salvador', 'BA'),
	(6, 'Fernanda Lima', 'Porto Alegre', 'RS'),
	(7, 'Paulo Santos', 'Recife', 'PE'),
	(8, 'Marcelo Gonçalves', 'Fortaleza', 'CE'),
	(9, 'Bruna Rodrigues', 'Brasília', 'DF'),
	(10, 'Mariana Cardoso', 'Goiânia', 'GO'),
	(11, 'Rafael Mendes', 'São Luís', 'MA'),
	(12, 'Camila Ribeiro', 'Maceió', 'AL'),
	(13, 'Lucas Almeida', 'Natal', 'RN'),
	(14, 'Juliana Castro', 'Manaus', 'AM'),
	(15, 'André Dias', 'Belém', 'PA'),
	(16, 'Gabriel Fernandes', 'Florianópolis', 'SC'),
	(17, 'Luana Martins', 'Campo Grande', 'MS'),
	(18, 'Renato Azevedo', 'Aracaju', 'SE'),
	(19, 'Beatriz Nunes', 'João Pessoa', 'PB'),
	(20, 'Thiago Farias', 'Vitória', 'ES');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Copiando estrutura para tabela pedidos.pedidos_dados_gerais
CREATE TABLE IF NOT EXISTS `pedidos_dados_gerais` (
  `numero_pedido` int NOT NULL,
  `data_emissao` date DEFAULT NULL,
  `valor_total` double DEFAULT NULL,
  `clientes_codigo` int NOT NULL,
  PRIMARY KEY (`numero_pedido`,`clientes_codigo`),
  KEY `fk_pedidos_dados_gerais_clientes_idx` (`clientes_codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela pedidos.pedidos_dados_gerais: 0 rows
/*!40000 ALTER TABLE `pedidos_dados_gerais` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_dados_gerais` ENABLE KEYS */;

-- Copiando estrutura para tabela pedidos.pedidos_produtos
CREATE TABLE IF NOT EXISTS `pedidos_produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantidade` double DEFAULT NULL,
  `valor_unitario` double DEFAULT NULL,
  `valor_total` double DEFAULT NULL,
  `produtos_codigo` int NOT NULL,
  `pedidos_dados_gerais_numero_pedido` int NOT NULL,
  PRIMARY KEY (`id`,`produtos_codigo`,`pedidos_dados_gerais_numero_pedido`),
  KEY `fk_pedidos_produtos_produtos1_idx` (`produtos_codigo`),
  KEY `fk_pedidos_produtos_pedidos_dados_gerais1_idx` (`pedidos_dados_gerais_numero_pedido`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela pedidos.pedidos_produtos: 0 rows
/*!40000 ALTER TABLE `pedidos_produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_produtos` ENABLE KEYS */;

-- Copiando estrutura para tabela pedidos.produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `preco_venda` double DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela pedidos.produtos: 20 rows
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` (`codigo`, `descricao`, `preco_venda`) VALUES
	(1, 'Arroz Branco 1kg', 5.49),
	(2, 'Feijão Preto 1kg', 7.89),
	(3, 'Macarrão Espaguete 500g', 4.29),
	(4, 'Açúcar Refinado 1kg', 3.99),
	(5, 'Café Torrado 500g', 9.5),
	(6, 'Óleo de Soja 900ml', 6.3),
	(7, 'Farinha de Trigo 1kg', 4.99),
	(8, 'Leite Integral 1L', 4.5),
	(9, 'Manteiga com Sal 200g', 8.9),
	(10, 'Sabonete Neutro', 1.75),
	(11, 'Detergente Líquido 500ml', 2.3),
	(12, 'Papel Higiênico 4 Rolos', 6.99),
	(13, 'Refrigerante 2L', 7.2),
	(14, 'Molho de Tomate 340g', 3.45),
	(15, 'Achocolatado em Pó 400g', 7.8),
	(16, 'Biscoito Recheado 130g', 2.5),
	(17, 'Amaciante de Roupas 1L', 8.5),
	(18, 'Desodorante Aerosol 150ml', 11.3),
	(19, 'Arroz Integral 1kg', 6.79),
	(20, 'Iogurte Natural 170g', 2.4);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
