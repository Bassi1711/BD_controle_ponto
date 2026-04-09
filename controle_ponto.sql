-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09/04/2026 às 02:37
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `controle_ponto`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id_funcionario` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `ra` varchar(15) NOT NULL,
  `id_setor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id_funcionario`, `nome`, `cargo`, `ra`, `id_setor`) VALUES
(1, 'Agatha', NULL, '', 1),
(2, 'Geovana', NULL, '', 1),
(3, 'Guillia', NULL, '', 1),
(4, 'Laura', 'gestora', '', 1),
(5, 'Letícia', NULL, '', 1),
(6, 'Sarah', 'aux_gestora', '', 1),
(7, 'Julio Aparecido', 'gestor', '', 2),
(8, 'Matheus Bassi', 'aux_gestor', '1125958601', 2),
(9, 'Julio Cesar', NULL, '1125541969', 2),
(10, 'Lucca', NULL, '', 2),
(11, 'Vinicius', NULL, '', 2),
(12, 'Andrew', NULL, '', 2),
(13, 'Steven Gabriel', NULL, '', 3),
(14, 'Camilla', NULL, '', 3),
(15, 'Karen', NULL, '', 3),
(16, 'Alikeyla', NULL, '', 3),
(17, 'Maria Eduarda', NULL, '', 3),
(18, 'Manuela', NULL, '', 3),
(19, 'Maria Victoria', NULL, '', 4),
(20, 'Isabella Holanda', NULL, '', 4),
(21, 'Matheus Alves', NULL, '', 4),
(22, 'Maria Eduarda Santos', NULL, '', 4),
(23, 'Vitoria', NULL, '', 4),
(24, 'Flavia Libonátti', NULL, '', 4),
(25, 'Delfa', NULL, '', 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `registros_ponto`
--

CREATE TABLE `registros_ponto` (
  `id_registro` int(11) NOT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `data` date NOT NULL,
  `entrada` time DEFAULT NULL,
  `saida` time DEFAULT NULL,
  `intervalo_inicio` time DEFAULT NULL,
  `intervalo_fim` time DEFAULT NULL,
  `horas_trabalhadas` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `setores`
--

CREATE TABLE `setores` (
  `id_setor` int(11) NOT NULL,
  `nome_setor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `setores`
--

INSERT INTO `setores` (`id_setor`, `nome_setor`) VALUES
(1, '3ºA'),
(2, '3ºB'),
(3, '3ºC'),
(4, '3ºD');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id_funcionario`),
  ADD KEY `id_setor` (`id_setor`);

--
-- Índices de tabela `registros_ponto`
--
ALTER TABLE `registros_ponto`
  ADD PRIMARY KEY (`id_registro`),
  ADD KEY `id_funcionario` (`id_funcionario`);

--
-- Índices de tabela `setores`
--
ALTER TABLE `setores`
  ADD PRIMARY KEY (`id_setor`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `registros_ponto`
--
ALTER TABLE `registros_ponto`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `setores`
--
ALTER TABLE `setores`
  MODIFY `id_setor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `funcionarios_ibfk_1` FOREIGN KEY (`id_setor`) REFERENCES `setores` (`id_setor`);

--
-- Restrições para tabelas `registros_ponto`
--
ALTER TABLE `registros_ponto`
  ADD CONSTRAINT `registros_ponto_ibfk_1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
