<?php
require_once __DIR__ . '/../services/session.php';

require_once __DIR__ . '/../models/Post.php';
require_once __DIR__ . '/../models/Topico.php';

class PostController {
    public static function index() {
        $posts = Post::encontrarPostsRecentes();

        include __DIR__ . '/../views/posts/posts.php';
    }

    public static function explorar() {
        $topicos = Topico::encontrarTopicos();
        $idTopico = $_GET['topico'] ?? null;
        $posts = [];
        $topicoAtual = null;

        if ($idTopico) {
            $posts = Topico::encontrarPostsPorTopico($idTopico);
            foreach ($topicos as $t) {
                if ($t['id_topico'] == $idTopico) {
                    $topicoAtual = $t;
                    break;
                }
            }
        }

        include __DIR__ . '/../views/posts/explorar.php';
    }

    public static function pesquisar() {
        $busca = $_GET['q'] ?? '';
        $posts = [];
        $usuarios = [];
        if ($busca) {
            $posts = Post::pesquisarPosts($busca);
            $usuarios = Usuario::pesquisarUsuarios($busca);
        }

        include __DIR__ . '/../views/posts/pesquisar.php';
    }

    public static function encontrarPost() {
        $posts = Post::encontrarPosts();

        include __DIR__ . '/../views/posts/posts.php';
    }

    public static function criarPost() {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $idUsuario = $_SESSION['id_usuario'] ?? null;
            $conteudo = $_POST['conteudo'] ?? null;
            $anexo = $_POST['anexo'] ?? '';

            Post::criarPost($idUsuario, $conteudo, $anexo);

            if (is_null($idUsuario) || is_null($conteudo)) {
                echo "<br> Erro ao postar, tente novamente";
            } else {
                header('Location: /php-twitter/');
            }
        }

        include __DIR__ . '/../views/posts/criar-post.php';
    }

    public static function editarPost($idPost) {
        $post = Post::encontrarPostPorId($idPost);

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $conteudo = $_POST['conteudo'] ?? null;
            $anexo = $_POST['anexo'] ?? '';

            Post::editarPost($idPost, $conteudo, $anexo);

            if (is_null($idPost) || is_null($conteudo)) {
                echo "<br> Erro ao postar, tente novamente";
            } else {
                header("Location: /php-twitter/");
            }
        }

        include __DIR__ . '/../views/posts/editar-post.php';
    }

    public static function apagarPost($idPost) {
        Post::apagarPost($idPost);

        header('Location: /php-twitter/');
    }

    public static function likePost($idPost) {
        $idUsuario = $_SESSION['id_usuario'] ?? null;

        if ($idPost && $idUsuario) {
            Post::likePost($idPost, $idUsuario);
        }

        header('Location: /php-twitter/post/' . $idPost);
    }
}