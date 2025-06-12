-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2025 at 03:10 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `twitter`
--

-- --------------------------------------------------------

--
-- Table structure for table `mensagem_privada`
--

CREATE TABLE `mensagem_privada` (
  `id_mensagem_privada` int(11) NOT NULL,
  `id_usuario_remetente` int(11) NOT NULL,
  `id_usuario_destinatario` int(11) NOT NULL,
  `conteudo` varchar(255) NOT NULL,
  `data_envio` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mensagem_privada`
--

INSERT INTO `mensagem_privada` (`id_mensagem_privada`, `id_usuario_remetente`, `id_usuario_destinatario`, `conteudo`, `data_envio`) VALUES
(1, 1, 4, 'Olá Mod1, tudo pronto para o evento?', '2025-06-11 22:25:04'),
(2, 1, 7, 'Bem-vinda, Alice!', '2025-06-11 22:25:04'),
(3, 2, 5, 'Mod2, parabéns pelo trabalho!', '2025-06-11 22:25:04'),
(4, 2, 8, 'Bob, conte conosco!', '2025-06-11 22:25:04'),
(5, 3, 6, 'Mod3, novidades em breve!', '2025-06-11 22:25:04'),
(6, 3, 9, 'Carol, participe do sorteio!', '2025-06-11 22:25:04'),
(7, 4, 1, 'Admin1, evento confirmado.', '2025-06-11 22:25:04'),
(8, 4, 7, 'Alice, participe do fórum!', '2025-06-11 22:25:04'),
(9, 4, 8, 'Bob, novidades em tecnologia!', '2025-06-11 22:25:04'),
(10, 5, 2, 'Admin2, obrigado!', '2025-06-11 22:25:04'),
(11, 5, 9, 'Carol, live de esportes hoje!', '2025-06-11 22:25:04'),
(12, 5, 10, 'Dan, já viu o jogo?', '2025-06-11 22:25:04'),
(13, 6, 3, 'Admin3, novidades enviadas.', '2025-06-11 22:25:04'),
(14, 6, 11, 'Eve, playlist nova!', '2025-06-11 22:25:04'),
(15, 6, 12, 'Frank, app novo lançado!', '2025-06-11 22:25:04'),
(16, 7, 8, 'Bob, recomenda um livro?', '2025-06-11 22:25:04'),
(17, 8, 9, 'Carol, vai jogar hoje?', '2025-06-11 22:25:04'),
(18, 9, 10, 'Dan, qual filme recomenda?', '2025-06-11 22:25:04'),
(19, 10, 11, 'Eve, manda playlist!', '2025-06-11 22:25:04'),
(20, 11, 12, 'Frank, novidades de música?', '2025-06-11 22:25:04'),
(21, 12, 13, 'Grace, viagem marcada?', '2025-06-11 22:25:04'),
(22, 13, 14, 'Heidi, receita nova?', '2025-06-11 22:25:04'),
(23, 14, 15, 'Ivan, futebol domingo?', '2025-06-11 22:25:04'),
(24, 15, 7, 'Alice, fotos da viagem?', '2025-06-11 22:25:04');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id_post` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `conteudo` varchar(255) NOT NULL,
  `data_postagem` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `anexo` varchar(50) DEFAULT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id_post`, `id_usuario`, `conteudo`, `data_postagem`, `anexo`, `likes`) VALUES
(1, 1, 'Bem-vindos ao Twitter PHP! #Tecnologia', '2025-06-11 22:25:04', NULL, 5),
(2, 2, 'Aproveitem para compartilhar ideias! #Programação', '2025-06-11 22:25:04', NULL, 3),
(3, 3, 'Dúvidas? Fale com a equipe! #Inovação', '2025-06-11 22:25:04', NULL, 2),
(4, 4, 'Novidades em tecnologia chegando! #Tecnologia', '2025-06-11 22:25:04', NULL, 4),
(5, 4, 'Qual seu gadget favorito? #Inovação', '2025-06-11 22:25:04', NULL, 2),
(6, 5, 'Final do campeonato de futebol! #Futebol', '2025-06-11 22:25:04', NULL, 6),
(7, 5, 'Basquete ou futebol: qual você prefere? #Basquete', '2025-06-11 22:25:04', NULL, 1),
(8, 6, 'Filmes que marcaram época #Cinema', '2025-06-11 22:25:04', NULL, 3),
(9, 6, 'Qual seu estilo musical favorito? #Música', '2025-06-11 22:25:04', NULL, 2),
(10, 7, 'Acabei de ler um livro incrível! #Livros', '2025-06-11 22:25:04', NULL, 2),
(11, 7, 'Alguém recomenda um romance?', '2025-06-11 22:25:04', NULL, 1),
(12, 8, 'Jogo de futebol hoje! #Futebol', '2025-06-11 22:25:04', NULL, 3),
(13, 9, 'Zerei um game novo! #Tecnologia', '2025-06-11 22:25:04', NULL, 2),
(14, 9, 'Stream hoje às 20h!', '2025-06-11 22:25:04', NULL, 1),
(15, 9, 'Quem curte programação?', '2025-06-11 22:25:04', NULL, 0),
(16, 10, 'Assisti um filme sensacional #Cinema', '2025-06-11 22:25:04', NULL, 2),
(17, 11, 'Nova playlist no ar! #Música', '2025-06-11 22:25:04', NULL, 1),
(18, 12, 'Testando um app novo #Inovação', '2025-06-11 22:25:04', NULL, 1),
(19, 13, 'Viagem marcada para o interior!', '2025-06-11 22:25:04', NULL, 0),
(20, 14, 'Receita nova no blog!', '2025-06-11 22:25:04', NULL, 1),
(21, 15, 'Futebol de domingo é tradição #Futebol', '2025-06-11 22:25:04', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `post_resposta`
--

CREATE TABLE `post_resposta` (
  `id_post_resposta` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `conteudo` varchar(255) NOT NULL,
  `data_postagem` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `anexo` varchar(50) DEFAULT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_resposta`
--

INSERT INTO `post_resposta` (`id_post_resposta`, `id_post`, `id_usuario`, `conteudo`, `data_postagem`, `anexo`, `likes`) VALUES
(1, 4, 1, 'Ótima notícia, Mod1!', '2025-06-11 22:28:56', NULL, 1),
(2, 5, 1, 'Gadget favorito: smartphone!', '2025-06-11 22:28:56', NULL, 0),
(3, 6, 2, 'Final emocionante!', '2025-06-11 22:28:56', NULL, 1),
(4, 7, 2, 'Prefiro futebol!', '2025-06-11 22:28:56', NULL, 0),
(5, 8, 3, 'Filme incrível mesmo!', '2025-06-11 22:28:56', NULL, 1),
(6, 9, 3, 'Rock é vida!', '2025-06-11 22:28:56', NULL, 0),
(7, 1, 4, 'Obrigado, Admin1!', '2025-06-11 22:29:23', NULL, 1),
(8, 2, 4, 'Vamos compartilhar sim!', '2025-06-11 22:29:23', NULL, 0),
(9, 2, 5, 'Ótima ideia!', '2025-06-11 22:29:23', NULL, 1),
(10, 3, 5, 'Equipe pronta para ajudar!', '2025-06-11 22:29:23', NULL, 0),
(11, 3, 6, 'Conte comigo!', '2025-06-11 22:29:23', NULL, 1),
(12, 1, 6, 'Parabéns pelo projeto!', '2025-06-11 22:29:23', NULL, 0),
(13, 1, 7, 'Adorei a novidade!', '2025-06-11 22:29:23', NULL, 1),
(14, 2, 8, 'Ideias anotadas!', '2025-06-11 22:29:23', NULL, 0),
(15, 3, 9, 'Equipe top!', '2025-06-11 22:29:23', NULL, 1),
(16, 4, 10, 'Tecnologia é tudo!', '2025-06-11 22:29:23', NULL, 0),
(17, 5, 11, 'Prefiro futebol!', '2025-06-11 22:29:23', NULL, 1),
(18, 6, 12, 'Música sempre presente!', '2025-06-11 22:29:23', NULL, 0),
(19, 7, 13, 'Amo livros!', '2025-06-11 22:29:23', NULL, 1),
(20, 8, 14, 'Playlist salva!', '2025-06-11 22:29:23', NULL, 0),
(21, 9, 15, 'Programação é vida!', '2025-06-11 22:29:23', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_topico`
--

CREATE TABLE `post_topico` (
  `id_post_topico` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `id_topico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_topico`
--

INSERT INTO `post_topico` (`id_post_topico`, `id_post`, `id_topico`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 6, 4),
(5, 7, 5),
(7, 8, 7),
(8, 9, 8),
(9, 10, 9),
(10, 4, 1),
(11, 5, 3),
(12, 12, 4),
(13, 13, 1),
(14, 16, 7),
(15, 17, 8),
(16, 18, 3),
(17, 21, 4);

-- --------------------------------------------------------

--
-- Table structure for table `topico`
--

CREATE TABLE `topico` (
  `id_topico` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `topico`
--

INSERT INTO `topico` (`id_topico`, `nome`) VALUES
(1, 'Tecnologia'),
(2, 'Programação'),
(3, 'Inovação'),
(4, 'Futebol'),
(5, 'Basquete'),
(6, 'Esportes Radicais'),
(7, 'Cinema'),
(8, 'Música'),
(9, 'Livros');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `tipo` enum('normal','moderador','admin') NOT NULL DEFAULT 'normal',
  `nickname` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `bio` varchar(255) NOT NULL DEFAULT '',
  `data_nascimento` date DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `tipo`, `nickname`, `email`, `senha`, `bio`, `data_nascimento`, `cpf`) VALUES
(1, 'admin', 'Admin1', 'admin1@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Administrador principal', '1980-01-01', '11111111111'),
(2, 'admin', 'Admin2', 'admin2@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Administrador secundário', '1982-02-02', '22222222222'),
(3, 'admin', 'Admin3', 'admin3@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Administrador de suporte', '1984-03-03', '33333333333'),
(4, 'moderador', 'Mod1', 'mod1@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Moderador de tecnologia', '1990-04-04', '44444444444'),
(5, 'moderador', 'Mod2', 'mod2@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Moderador de esportes', '1991-05-05', '55555555555'),
(6, 'moderador', 'Mod3', 'mod3@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Moderador de cultura', '1992-06-06', '66666666666'),
(7, 'normal', 'Alice', 'alice@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Apaixonada por livros', '2000-07-07', '77777777777'),
(8, 'normal', 'Bob', 'bob@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Fã de esportes', '2001-08-08', '88888888888'),
(9, 'normal', 'Carol', 'carol@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Gamer e streamer', '2002-09-09', '99999999999'),
(10, 'normal', 'Dan', 'dan@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Cinéfilo', '2003-10-10', '10101010101'),
(11, 'normal', 'Eve', 'eve@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Música é vida', '2004-11-11', '12121212121'),
(12, 'normal', 'Frank', 'frank@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Amo tecnologia', '2005-12-12', '13131313131'),
(13, 'normal', 'Grace', 'grace@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Viajante', '2006-01-13', '14141414141'),
(14, 'normal', 'Heidi', 'heidi@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Cozinheira de mão cheia', '2007-02-14', '15151515151'),
(15, 'normal', 'Ivan', 'ivan@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Futebol é paixão', '2008-03-15', '16161616161'),
(16, 'normal', 'Judy', 'judy@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Fotógrafa', '2009-04-16', '17171717171');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mensagem_privada`
--
ALTER TABLE `mensagem_privada`
  ADD PRIMARY KEY (`id_mensagem_privada`),
  ADD KEY `remetente` (`id_usuario_remetente`),
  ADD KEY `destinatario` (`id_usuario_destinatario`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id_post`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `post_resposta`
--
ALTER TABLE `post_resposta`
  ADD PRIMARY KEY (`id_post_resposta`),
  ADD KEY `resposta_post` (`id_post`),
  ADD KEY `resposta_usuario` (`id_usuario`);

--
-- Indexes for table `post_topico`
--
ALTER TABLE `post_topico`
  ADD PRIMARY KEY (`id_post_topico`),
  ADD KEY `pt_post` (`id_post`),
  ADD KEY `pt_topico` (`id_topico`);

--
-- Indexes for table `topico`
--
ALTER TABLE `topico`
  ADD PRIMARY KEY (`id_topico`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mensagem_privada`
--
ALTER TABLE `mensagem_privada`
  MODIFY `id_mensagem_privada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `post_resposta`
--
ALTER TABLE `post_resposta`
  MODIFY `id_post_resposta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `post_topico`
--
ALTER TABLE `post_topico`
  MODIFY `id_post_topico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `topico`
--
ALTER TABLE `topico`
  MODIFY `id_topico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mensagem_privada`
--
ALTER TABLE `mensagem_privada`
  ADD CONSTRAINT `destinatario` FOREIGN KEY (`id_usuario_destinatario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `remetente` FOREIGN KEY (`id_usuario_remetente`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post_resposta`
--
ALTER TABLE `post_resposta`
  ADD CONSTRAINT `resposta_post` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`) ON DELETE CASCADE,
  ADD CONSTRAINT `resposta_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Constraints for table `post_topico`
--
ALTER TABLE `post_topico`
  ADD CONSTRAINT `pt_post` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pt_topico` FOREIGN KEY (`id_topico`) REFERENCES `topico` (`id_topico`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
