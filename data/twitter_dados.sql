-- Arquivo: dados_twitter.sql
-- Popula o banco twitter com dados de admins, moderadores, usuários, tópicos, posts, respostas e mensagens privadas

-- Usuários: 3 admins, 3 moderadores, 9 usuários
INSERT INTO usuario (tipo, nickname, email, senha, bio, data_nascimento, cpf) VALUES
('admin', 'Admin1', 'admin1@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Administrador principal', '1980-01-01', '11111111111'),
('admin', 'Admin2', 'admin2@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Administrador secundário', '1982-02-02', '22222222222'),
('admin', 'Admin3', 'admin3@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Administrador de suporte', '1984-03-03', '33333333333'),
('moderador', 'Mod1', 'mod1@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Moderador de tecnologia', '1990-04-04', '44444444444'),
('moderador', 'Mod2', 'mod2@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Moderador de esportes', '1991-05-05', '55555555555'),
('moderador', 'Mod3', 'mod3@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Moderador de cultura', '1992-06-06', '66666666666'),
('normal', 'Alice', 'alice@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Apaixonada por livros', '2000-07-07', '77777777777'),
('normal', 'Bob', 'bob@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Fã de esportes', '2001-08-08', '88888888888'),
('normal', 'Carol', 'carol@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Gamer e streamer', '2002-09-09', '99999999999'),
('normal', 'Dan', 'dan@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Cinéfilo', '2003-10-10', '10101010101'),
('normal', 'Eve', 'eve@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Música é vida', '2004-11-11', '12121212121'),
('normal', 'Frank', 'frank@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Amo tecnologia', '2005-12-12', '13131313131'),
('normal', 'Grace', 'grace@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Viajante', '2006-01-13', '14141414141'),
('normal', 'Heidi', 'heidi@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Cozinheira de mão cheia', '2007-02-14', '15151515151'),
('normal', 'Ivan', 'ivan@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Futebol é paixão', '2008-03-15', '16161616161'),
('normal', 'Judy', 'judy@email.com', '$2y$10$//C4OVRMC4kBRxZ2H7jlEO7r9LKk66b0aCi5KkUgp51FgKAYk9euq', 'Fotógrafa', '2009-04-16', '17171717171');

-- Tópicos (3 por moderador)
INSERT INTO topico (nome) VALUES
('Tecnologia'), ('Programação'), ('Inovação'), -- Mod1
('Futebol'), ('Basquete'), ('Esportes Radicais'), -- Mod2
('Cinema'), ('Música'), ('Livros'); -- Mod3

-- Posts dos admins (id_usuario 1,2,3)
INSERT INTO post (id_usuario, conteudo, anexo, likes) VALUES
(1, 'Bem-vindos ao Twitter PHP! #Tecnologia', NULL, 5),
(2, 'Aproveitem para compartilhar ideias! #Programação', NULL, 3),
(3, 'Dúvidas? Fale com a equipe! #Inovação', NULL, 2);

-- Posts dos moderadores (id_usuario 4,5,6)
INSERT INTO post (id_usuario, conteudo, anexo, likes) VALUES
(4, 'Novidades em tecnologia chegando! #Tecnologia', NULL, 4),
(4, 'Qual seu gadget favorito? #Inovação', NULL, 2),
(5, 'Final do campeonato de futebol! #Futebol', NULL, 6),
(5, 'Basquete ou futebol: qual você prefere? #Basquete', NULL, 1),
(6, 'Filmes que marcaram época #Cinema', NULL, 3),
(6, 'Qual seu estilo musical favorito? #Música', NULL, 2);

-- Posts dos usuários (id_usuario 7-15)
INSERT INTO post (id_usuario, conteudo, anexo, likes) VALUES
(7, 'Acabei de ler um livro incrível! #Livros', NULL, 2),
(7, 'Alguém recomenda um romance?', NULL, 1),
(8, 'Jogo de futebol hoje! #Futebol', NULL, 3),
(9, 'Zerei um game novo! #Tecnologia', NULL, 2),
(9, 'Stream hoje às 20h!', NULL, 1),
(9, 'Quem curte programação?', NULL, 0),
(10, 'Assisti um filme sensacional #Cinema', NULL, 2),
(11, 'Nova playlist no ar! #Música', NULL, 1),
(12, 'Testando um app novo #Inovação', NULL, 1),
(13, 'Viagem marcada para o interior!', NULL, 0),
(14, 'Receita nova no blog!', NULL, 1),
(15, 'Futebol de domingo é tradição #Futebol', NULL, 2);

-- Respostas dos admins (2 para cada, em posts variados)
INSERT INTO post_resposta (id_post, id_usuario, conteudo, anexo, likes) VALUES
(4, 1, 'Ótima notícia, Mod1!', NULL, 1),
(5, 1, 'Gadget favorito: smartphone!', NULL, 0),
(6, 2, 'Final emocionante!', NULL, 1),
(7, 2, 'Prefiro futebol!', NULL, 0),
(8, 3, 'Filme incrível mesmo!', NULL, 1),
(9, 3, 'Rock é vida!', NULL, 0);

-- Respostas dos moderadores (2 para cada, em posts variados)
INSERT INTO post_resposta (id_post, id_usuario, conteudo, anexo, likes) VALUES
(1, 4, 'Obrigado, Admin1!', NULL, 1),
(2, 4, 'Vamos compartilhar sim!', NULL, 0),
(2, 5, 'Ótima ideia!', NULL, 1),
(3, 5, 'Equipe pronta para ajudar!', NULL, 0),
(3, 6, 'Conte comigo!', NULL, 1),
(1, 6, 'Parabéns pelo projeto!', NULL, 0);

-- Respostas dos usuários (1 para cada, em posts variados)
INSERT INTO post_resposta (id_post, id_usuario, conteudo, anexo, likes) VALUES
(1, 7, 'Adorei a novidade!', NULL, 1),
(2, 8, 'Ideias anotadas!', NULL, 0),
(3, 9, 'Equipe top!', NULL, 1),
(4, 10, 'Tecnologia é tudo!', NULL, 0),
(5, 11, 'Prefiro futebol!', NULL, 1),
(6, 12, 'Música sempre presente!', NULL, 0),
(7, 13, 'Amo livros!', NULL, 1),
(8, 14, 'Playlist salva!', NULL, 0),
(9, 15, 'Programação é vida!', NULL, 1);

-- Relaciona posts a tópicos (um post para cada tópico)
INSERT INTO post_topico (id_post, id_topico) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9);

-- Mensagens privadas (cada usuário tem pelo menos uma, cada mod 3, cada admin 2)
-- Admins
INSERT INTO mensagem_privada (id_usuario_remetente, id_usuario_destinatario, conteudo) VALUES
(1, 4, 'Olá Mod1, tudo pronto para o evento?'),
(1, 7, 'Bem-vinda, Alice!'),
(2, 5, 'Mod2, parabéns pelo trabalho!'),
(2, 8, 'Bob, conte conosco!'),
(3, 6, 'Mod3, novidades em breve!'),
(3, 9, 'Carol, participe do sorteio!');
-- Moderadores
INSERT INTO mensagem_privada (id_usuario_remetente, id_usuario_destinatario, conteudo) VALUES
(4, 1, 'Admin1, evento confirmado.'),
(4, 7, 'Alice, participe do fórum!'),
(4, 8, 'Bob, novidades em tecnologia!'),
(5, 2, 'Admin2, obrigado!'),
(5, 9, 'Carol, live de esportes hoje!'),
(5, 10, 'Dan, já viu o jogo?'),
(6, 3, 'Admin3, novidades enviadas.'),
(6, 11, 'Eve, playlist nova!'),
(6, 12, 'Frank, app novo lançado!');
-- Usuários (cada um pelo menos uma)
INSERT INTO mensagem_privada (id_usuario_remetente, id_usuario_destinatario, conteudo) VALUES
(7, 8, 'Bob, recomenda um livro?'),
(8, 9, 'Carol, vai jogar hoje?'),
(9, 10, 'Dan, qual filme recomenda?'),
(10, 11, 'Eve, manda playlist!'),
(11, 12, 'Frank, novidades de música?'),
(12, 13, 'Grace, viagem marcada?'),
(13, 14, 'Heidi, receita nova?'),
(14, 15, 'Ivan, futebol domingo?'),
(15, 7, 'Alice, fotos da viagem?');

-- Fim do arquivo
