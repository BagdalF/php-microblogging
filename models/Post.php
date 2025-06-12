<?php
require_once __DIR__ . '/../services/banco.php';
require_once __DIR__ . '/../functions/hashtag.php';

class Post {

    public static function encontrarPosts()  {
        $banco = Banco::getConn();
        $res = $banco->query("SELECT * FROM post");
        return $res->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function encontrarPostPorId($postId)  {
        $banco = Banco::getConn();
        $res = $banco->query("SELECT post.*, usuario.nickname 
            FROM post 
            INNER JOIN usuario ON post.id_usuario = usuario.id_usuario
            WHERE id_post='$postId' LIMIT 1");
        return $res->fetch(PDO::FETCH_ASSOC);
    }

    public static function encontrarPostsPorUsuario($usuarioId)  {
        $banco = Banco::getConn();
        $res = $banco->query("SELECT post.*, usuario.nickname 
            FROM post 
            INNER JOIN usuario ON post.id_usuario = usuario.id_usuario
            WHERE post.id_usuario='$usuarioId'
            ORDER BY post.data_postagem DESC");
        return $res->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function encontrarPostsRecentes()  {
        $banco = Banco::getConn();
        $res = $banco->query(
            "SELECT post.*, usuario.nickname 
            FROM post 
            INNER JOIN usuario ON post.id_usuario = usuario.id_usuario
            ORDER BY data_postagem DESC");
        return $res->fetchAll(PDO::FETCH_ASSOC);
    }
    
    public static function criarPost($idUsuario, $conteudo, $anexo) {
        $banco = Banco::getConn();
        $res = $banco->prepare(
            "INSERT INTO post (id_usuario, conteudo, data_postagem, anexo, likes)
            VALUES (:id_usuario, :conteudo, current_timestamp(), :anexo, 0)"
        );
        
        $res->execute([
            ':id_usuario' => $idUsuario,
            ':conteudo' => $conteudo,
            ':anexo' => $anexo
        ]);

        registrarTopicosParaPost($banco->lastInsertId(), detectarHashtags($conteudo));
    }

    public static function editarPost($idPost, $conteudo, $anexo) {
        $banco = Banco::getConn();
        $res = $banco->prepare("UPDATE post SET conteudo = :conteudo, anexo = :anexo WHERE id_post = :id_post");
        $res->execute([
            ':conteudo' => $conteudo,
            ':anexo' => $anexo,
            ':id_post' => $idPost
        ]);

        // Atualiza os tópicos associados ao post
        $res = $banco->prepare("DELETE FROM post_topico WHERE id_post = :id_post");
        $res->execute([':id_post' => $idPost]);

        registrarTopicosParaPost($idPost, detectarHashtags($conteudo));
    }
    
    public static function apagarPost($idPost) {
        $banco = Banco::getConn();
        $res = $banco->prepare("DELETE FROM post WHERE id_post = :id_post");
        return $res->execute([':id_post' => $idPost]);
    }

    public static function likePost($idPost, $idUsuario) {
        $banco = Banco::getConn();
        $res = $banco->prepare("UPDATE post SET likes = likes + 1 WHERE id_post = :id_post");
        $res->execute([':id_post' => $idPost]);
    }
    
    public static function pesquisarPosts($busca) {
        $banco = Banco::getConn();
        $res = $banco->prepare("SELECT post.*, usuario.nickname FROM post INNER JOIN usuario ON post.id_usuario = usuario.id_usuario WHERE post.conteudo LIKE :busca ORDER BY data_postagem DESC");
        $res->execute([':busca' => "%$busca%"]);
        return $res->fetchAll(PDO::FETCH_ASSOC);
    }
}