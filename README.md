# Twitter - Timeline de Tweets em PHP

## 🐦 Visão Geral do Projeto

Este projeto é uma aplicação web desenvolvida com **PHP** que simula algumas funcionalidades básicas do **Twitter**. A aplicação permite visualizar uma timeline de tweets, acessar detalhes de cada tweet, filtrar por tópicos e gerenciar tweets a partir de uma área restrita para usuários autenticados.

O objetivo é oferecer um **mini sistema de microblogging**, ideal para fins educacionais, estudos de programação em PHP e prática de lógica de programação com foco em back-end web.

---
## 👥 Integrantes da Dupla

- Felipe Oliveira Bagdal - [BagdalF](https://github.com/BagdalF)
- Vinicius Marçal - [Vini-devs](https://github.com/Vini-devs)
- Calebe Andreatta de Oliveira - [cntoliveira](https://github.com/cntoliveira)
- Vitor Augusto Costa - [Vitor-vt](https://github.com/Vitor-vt)

## 🚀 Funcionalidades

- **📰 Timeline de Tweets**: Exibe uma lista de tweets com imagem, título e tópico.
- **🔍 Detalhes do Tweet**: Cada tweet possui uma página dedicada com informações detalhadas.
- **🏷️ Filtro por Tópico**: Os usuários podem filtrar os tweets por tópico através da página `pesquisar.php`.
- **🔐 Autenticação de Usuário**: Login simples via `login.php`, protegendo o acesso a áreas restritas.
- **🛠️ Área Protegida**: Usuários logados podem **criar tweets** e visualizar os tweets cadastrados em `protected.php`.

---

## 🧰 Tecnologias e Ferramentas Utilizadas

- **PHP** (100% php, sem frameworks)
- **Armazenamento em Arquivo**: Tweets são armazenados em arrays dentro do arquivo `data/items.php` (sem uso de banco de dados neste projeto)
- **Estrutura Modular com Includes**: Uso de `include` e `require` para separar layout, funções e dados
- **Funções Reutilizáveis**: Localizadas em `functions/helpers.php` para organizar a lógica

---

## 📁 Estrutura de Arquivos

```
php-twitter-clone
├── data
│ └── items.php # Tweets simulados em array associativo
├── layout
│ ├── header.php # Cabeçalho comum
│ └── footer.php # Rodapé comum
├── functions
│ └── helpers.php # Funções auxiliares reutilizáveis
├── index.php # Página principal com timeline
├── detalhes.php # Página de detalhes de um tweet
├── pesquisar.php # Filtro de tweets por tópico
├── login.php # Tela de login
├── protected.php # Área restrita para gerenciar tweets
├── README.md # Este arquivo :)
└── .gitignore
```

---

## ⚙️ Instruções de Instalação e Execução

1. **Clone este repositório** ou baixe os arquivos para sua máquina local.
2. **Instale um servidor local** (recomendado: [XAMPP](https://www.apachefriends.org/)).
3. **Copie a pasta do projeto** para o diretório raiz do servidor local (`htdocs` no XAMPP).
4. **Inicie o Apache** (e o MySQL, se desejar usá-lo no futuro).
5. **Acesse a aplicação** no navegador: http://localhost/php-twitter-clone/index.php
