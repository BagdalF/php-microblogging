# Twitter - Timeline de Tweets em PHP

## 🐦 Visão Geral do Projeto

Este projeto é uma aplicação web desenvolvida com **PHP** que simula funcionalidades essenciais do **Twitter**. Permite visualizar uma timeline de tweets, explorar tópicos, pesquisar posts e usuários, enviar mensagens privadas (DM), responder posts, curtir, editar e excluir conteúdos, além de contar com autenticação e hierarquia de usuários (normal, moderador, admin).

Ideal para fins educacionais, prática de lógica de programação e estudos de back-end web.

---

## 🤝 Integrantes da Equipe

- Felipe Oliveira Bagdal - [BagdalF](https://github.com/BagdalF)
- Vinicius Marçal - [Vini-devs](https://github.com/Vini-devs)
- Calebe Andreatta de Oliveira - [cntoliveira](https://github.com/cntoliveira)
- Vitor Augusto Costa - [Vitor-vt](https://github.com/Vitor-vt)

## 🚀 Funcionalidades

- **📰 Timeline de Tweets**: Exibe uma lista de tweets com imagem, autor e data.
- **🔍 Pesquisa**: Busca posts e usuários por palavra-chave.
- **🏷️ Explorar Tópicos**: Mosaico de tópicos para filtrar posts.
- **💬 Respostas**: Responda a posts e visualize conversas.
- **❤️ Curtidas**: Curta posts e respostas.
- **📩 Mensagens Privadas (DM)**: Envie e gerencie mensagens diretas entre usuários.
- **🔐 Autenticação**: Login, cadastro, recuperação de senha e logout.
- **🛠️ Hierarquia de Usuários**: Usuários normais, moderadores (gerenciam tópicos) e admins (gerenciam tudo).
- **⚙️ Preferências**: Troca de tema claro/escuro com persistência via cookie.

---

## 🧰 Tecnologias e Ferramentas Utilizadas

- **PHP** (puro, sem frameworks)
- **Bootstrap 5** (CDN)
- **Bootstrap Icons**
- **MariaDB/MySQL (phpMyAdmin)**

---

## 📁 Estrutura de Arquivos

```
php-twitter
├── controllers
│   ├── AuthController.php
│   ├── PostController.php
│   ├── RespostaController.php
│   ├── MensagemController.php
│   └── TopicoController.php
├── data
│   ├── twitter_vazio.sql
│   └── twitter_populado.sql
├── functions
│   ├── helpers.php
│   └── hashtag.php
├── models
│   ├── Usuario.php
│   ├── Post.php
│   ├── Resposta.php
│   ├── Mensagem.php
│   └── Topico.php
├── services
│   ├── banco.php
│   └── session.php
├── views
│   ├── layout
│   │   ├── header.php
│   │   ├── footer.php
│   │   ├── cards.php
│   │   └── dm.php
│   ├── mensagens
│   │   ├── mensagens.php
│   │   └── editar-mensagem.php
│   ├── posts
│   │   ├── posts.php
│   │   ├── criar-post.php
│   │   ├── editar-post.php
│   │   ├── explorar.php
│   │   └── pesquisar.php
│   ├── respostas
│   │   ├── respostas.php
│   │   ├── criar-resposta.php
│   │   └── editar-resposta.php
│   ├── topicos
│   │   ├── criar-topico.php
│   │   └── editar-topico.php
│   └── usuarios
│       ├── usuario.php
│       ├── editar-usuario.php
│       ├── cadastro.php
│       ├── login.php
│       ├── recuperar-senha.php
│       └── dashboard.php
├── .htaccess
├── .gitignore
├── index.php
└── README.md
```

---

## ⚙️ Instruções de Instalação e Execução

1. **Clone este repositório** ou baixe os arquivos para sua máquina local.
2. **Instale um servidor local** (recomendado: [XAMPP](https://www.apachefriends.org/)).
3. **Copie a pasta do projeto** para o diretório raiz do servidor local (`htdocs` no XAMPP).
4. **Crie o banco de dados** e importe o arquivo `data/twitter_vazio.sql` ou `data/twitter_populado.sql` via phpMyAdmin.
5. **Configure o acesso ao banco** em `services/banco.php` se necessário.
6. **Inicie o Apache e o MySQL**.
7. **Acesse a aplicação** no navegador: http://localhost/php-twitter/

---

## ℹ️ Observações

- Senha padrão para todos os usuários: `senha123` (para testes), recomendamos utilizar a conta de email fictícia "admin1@email.com" para o login.
- O sistema é apenas para fins didáticos e não deve ser usado em produção sem adaptações de segurança.
