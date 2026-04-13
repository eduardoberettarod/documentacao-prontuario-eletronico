-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13/04/2026 às 18:47
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
-- Banco de dados: `bd_prontuario_eletronico`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cuidados`
--

CREATE TABLE `cuidados` (
  `id` int(11) NOT NULL,
  `tipo_cuidado` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `horarios_prescricao`
--

CREATE TABLE `horarios_prescricao` (
  `id` int(11) NOT NULL,
  `item_prescricao_id` int(11) NOT NULL,
  `horario` datetime NOT NULL,
  `status_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens_prescricao`
--

CREATE TABLE `itens_prescricao` (
  `id` int(11) NOT NULL,
  `prescricao_id` int(11) NOT NULL,
  `medicamento_id` int(11) NOT NULL,
  `dosagem` decimal(10,2) DEFAULT NULL,
  `via` varchar(50) DEFAULT NULL,
  `frequencia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `medicamentos`
--

CREATE TABLE `medicamentos` (
  `id` int(11) NOT NULL,
  `nome_medicamento` varchar(150) NOT NULL,
  `classe_terapeutica` varchar(150) DEFAULT NULL,
  `unidade` enum('mg','g','mcg','ml','ui','%') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `nome_paciente` varchar(150) NOT NULL,
  `mae_paciente` varchar(150) NOT NULL,
  `data_nasc` date NOT NULL,
  `tipo_sanguineo` enum('A','B','AB','O') NOT NULL,
  `fator_rh` enum('+','-') NOT NULL,
  `equipe` varchar(150) NOT NULL,
  `status_paciente` enum('estavel','observacao','critico') NOT NULL,
  `convenio` varchar(100) NOT NULL,
  `quarto` varchar(10) NOT NULL,
  `leito` varchar(10) NOT NULL,
  `id_setor` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente_cuidados`
--

CREATE TABLE `paciente_cuidados` (
  `id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `cuidado_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `observacao` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `prescricoes`
--

CREATE TABLE `prescricoes` (
  `id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `observacao` text DEFAULT NULL,
  `data_prescricao` datetime DEFAULT current_timestamp(),
  `status_id` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `relatorios`
--

CREATE TABLE `relatorios` (
  `id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `conteudo` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `setores`
--

CREATE TABLE `setores` (
  `id` int(11) NOT NULL,
  `nome_setor` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `status_cuidado`
--

CREATE TABLE `status_cuidado` (
  `id` int(11) NOT NULL,
  `nome_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `status_cuidado`
--

INSERT INTO `status_cuidado` (`id`, `nome_status`) VALUES
(1, 'pendente'),
(2, 'finalizado'),
(3, 'nao_feito'),
(4, 'negado_paciente');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `primeiro_nome` varchar(50) NOT NULL,
  `sobrenome` varchar(50) NOT NULL,
  `email` varchar(120) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `nivel_acesso` enum('admin','docente','aluno') NOT NULL DEFAULT 'aluno',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `primeiro_nome`, `sobrenome`, `email`, `senha`, `nivel_acesso`, `created_at`) VALUES
(12, 'Usuario', 'Teste', 'teste.docente@demo.com', '$2b$10$lGZEzTmlp2MWgbsKV7c4XOvQtRsVjr0ID9iAB1vvt8gDKVU3UilRC', 'docente', '2026-04-13 16:34:00');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cuidados`
--
ALTER TABLE `cuidados`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `horarios_prescricao`
--
ALTER TABLE `horarios_prescricao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_prescricao_id` (`item_prescricao_id`),
  ADD KEY `horarios_prescricao_fk_status` (`status_id`);

--
-- Índices de tabela `itens_prescricao`
--
ALTER TABLE `itens_prescricao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prescricao_id` (`prescricao_id`),
  ADD KEY `medicamento_id` (`medicamento_id`);

--
-- Índices de tabela `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_paciente_setor` (`id_setor`);

--
-- Índices de tabela `paciente_cuidados`
--
ALTER TABLE `paciente_cuidados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paciente_id` (`paciente_id`),
  ADD KEY `cuidado_id` (`cuidado_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Índices de tabela `prescricoes`
--
ALTER TABLE `prescricoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paciente_id` (`paciente_id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `fk_prescricao_status` (`status_id`);

--
-- Índices de tabela `relatorios`
--
ALTER TABLE `relatorios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paciente_id` (`paciente_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `setores`
--
ALTER TABLE `setores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `status_cuidado`
--
ALTER TABLE `status_cuidado`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cuidados`
--
ALTER TABLE `cuidados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `horarios_prescricao`
--
ALTER TABLE `horarios_prescricao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de tabela `itens_prescricao`
--
ALTER TABLE `itens_prescricao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de tabela `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `paciente_cuidados`
--
ALTER TABLE `paciente_cuidados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `prescricoes`
--
ALTER TABLE `prescricoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `relatorios`
--
ALTER TABLE `relatorios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `setores`
--
ALTER TABLE `setores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `status_cuidado`
--
ALTER TABLE `status_cuidado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `horarios_prescricao`
--
ALTER TABLE `horarios_prescricao`
  ADD CONSTRAINT `horarios_prescricao_fk_status` FOREIGN KEY (`status_id`) REFERENCES `status_cuidado` (`id`),
  ADD CONSTRAINT `horarios_prescricao_ibfk_1` FOREIGN KEY (`item_prescricao_id`) REFERENCES `itens_prescricao` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `itens_prescricao`
--
ALTER TABLE `itens_prescricao`
  ADD CONSTRAINT `itens_prescricao_ibfk_1` FOREIGN KEY (`prescricao_id`) REFERENCES `prescricoes` (`id`),
  ADD CONSTRAINT `itens_prescricao_ibfk_2` FOREIGN KEY (`medicamento_id`) REFERENCES `medicamentos` (`id`);

--
-- Restrições para tabelas `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `fk_paciente_setor` FOREIGN KEY (`id_setor`) REFERENCES `setores` (`id`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `paciente_cuidados`
--
ALTER TABLE `paciente_cuidados`
  ADD CONSTRAINT `paciente_cuidados_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`),
  ADD CONSTRAINT `paciente_cuidados_ibfk_2` FOREIGN KEY (`cuidado_id`) REFERENCES `cuidados` (`id`),
  ADD CONSTRAINT `paciente_cuidados_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `status_cuidado` (`id`);

--
-- Restrições para tabelas `prescricoes`
--
ALTER TABLE `prescricoes`
  ADD CONSTRAINT `fk_prescricao_status` FOREIGN KEY (`status_id`) REFERENCES `status_cuidado` (`id`),
  ADD CONSTRAINT `prescricoes_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`),
  ADD CONSTRAINT `prescricoes_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `relatorios`
--
ALTER TABLE `relatorios`
  ADD CONSTRAINT `relatorios_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`),
  ADD CONSTRAINT `relatorios_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
