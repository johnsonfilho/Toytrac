-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05/06/2024 às 01:01
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `brinquedoteca`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `brinquedo`
--

CREATE TABLE `brinquedo` (
  `ID_Brinquedo` int(11) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `ID_TipoBrinquedo` int(11) DEFAULT NULL,
  `ID_FaixaEtaria` int(11) DEFAULT NULL,
  `Disponivel` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `faixaetaria`
--

CREATE TABLE `faixaetaria` (
  `ID_FaixaEtaria` int(11) NOT NULL,
  `FaixaEtaria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `jogo`
--

CREATE TABLE `jogo` (
  `ID_Jogo` int(11) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `ID_TipoJogo` int(11) DEFAULT NULL,
  `ID_FaixaEtaria` int(11) DEFAULT NULL,
  `Disponivel` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `locacao`
--

CREATE TABLE `locacao` (
  `ID_Locacao` int(11) NOT NULL,
  `ID_Brinquedo` int(11) DEFAULT NULL,
  `ID_Jogo` int(11) DEFAULT NULL,
  `ID_Usuario` int(11) DEFAULT NULL,
  `Data_Locacao` date DEFAULT NULL,
  `Data_Devolucao` date DEFAULT NULL,
  `Valor_Locacao` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipobrinquedo`
--

CREATE TABLE `tipobrinquedo` (
  `ID_TipoBrinquedo` int(11) NOT NULL,
  `Tipo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipojogo`
--

CREATE TABLE `tipojogo` (
  `ID_TipoJogo` int(11) NOT NULL,
  `Tipo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `ID_Usuario` int(11) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Senha` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `brinquedo`
--
ALTER TABLE `brinquedo`
  ADD PRIMARY KEY (`ID_Brinquedo`),
  ADD KEY `ID_TipoBrinquedo` (`ID_TipoBrinquedo`),
  ADD KEY `ID_FaixaEtaria` (`ID_FaixaEtaria`);

--
-- Índices de tabela `faixaetaria`
--
ALTER TABLE `faixaetaria`
  ADD PRIMARY KEY (`ID_FaixaEtaria`);

--
-- Índices de tabela `jogo`
--
ALTER TABLE `jogo`
  ADD PRIMARY KEY (`ID_Jogo`),
  ADD KEY `ID_TipoJogo` (`ID_TipoJogo`),
  ADD KEY `ID_FaixaEtaria` (`ID_FaixaEtaria`);

--
-- Índices de tabela `locacao`
--
ALTER TABLE `locacao`
  ADD PRIMARY KEY (`ID_Locacao`),
  ADD KEY `ID_Brinquedo` (`ID_Brinquedo`),
  ADD KEY `ID_Jogo` (`ID_Jogo`),
  ADD KEY `ID_Usuario` (`ID_Usuario`);

--
-- Índices de tabela `tipobrinquedo`
--
ALTER TABLE `tipobrinquedo`
  ADD PRIMARY KEY (`ID_TipoBrinquedo`);

--
-- Índices de tabela `tipojogo`
--
ALTER TABLE `tipojogo`
  ADD PRIMARY KEY (`ID_TipoJogo`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_Usuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `brinquedo`
--
ALTER TABLE `brinquedo`
  MODIFY `ID_Brinquedo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `faixaetaria`
--
ALTER TABLE `faixaetaria`
  MODIFY `ID_FaixaEtaria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `jogo`
--
ALTER TABLE `jogo`
  MODIFY `ID_Jogo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `locacao`
--
ALTER TABLE `locacao`
  MODIFY `ID_Locacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipobrinquedo`
--
ALTER TABLE `tipobrinquedo`
  MODIFY `ID_TipoBrinquedo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipojogo`
--
ALTER TABLE `tipojogo`
  MODIFY `ID_TipoJogo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `brinquedo`
--
ALTER TABLE `brinquedo`
  ADD CONSTRAINT `brinquedo_ibfk_1` FOREIGN KEY (`ID_TipoBrinquedo`) REFERENCES `tipobrinquedo` (`ID_TipoBrinquedo`),
  ADD CONSTRAINT `brinquedo_ibfk_2` FOREIGN KEY (`ID_FaixaEtaria`) REFERENCES `faixaetaria` (`ID_FaixaEtaria`);

--
-- Restrições para tabelas `jogo`
--
ALTER TABLE `jogo`
  ADD CONSTRAINT `jogo_ibfk_1` FOREIGN KEY (`ID_TipoJogo`) REFERENCES `tipojogo` (`ID_TipoJogo`),
  ADD CONSTRAINT `jogo_ibfk_2` FOREIGN KEY (`ID_FaixaEtaria`) REFERENCES `faixaetaria` (`ID_FaixaEtaria`);

--
-- Restrições para tabelas `locacao`
--
ALTER TABLE `locacao`
  ADD CONSTRAINT `locacao_ibfk_1` FOREIGN KEY (`ID_Brinquedo`) REFERENCES `brinquedo` (`ID_Brinquedo`),
  ADD CONSTRAINT `locacao_ibfk_2` FOREIGN KEY (`ID_Jogo`) REFERENCES `jogo` (`ID_Jogo`),
  ADD CONSTRAINT `locacao_ibfk_3` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
