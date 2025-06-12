<?php
require_once __DIR__ . '/../services/banco.php';

class Resposta {
    static function encontrarRespostas($postId) {
        $banco = Banco::getConn();
        $res = $banco->query("SELECT post_resposta.*, usuario.nickname 
            FROM post_resposta 
            INNER JOIN usuario ON post_resposta.id_usuario = usuario.id_usuario
            WHERE id_post='$postId'");
        return $res->fetchAll(PDO::FETCH_ASSOC);
    }

    static function encontrarRespostaPorId($respostaId) {
        $banco = Banco::getConn();
        $res = $banco->query("SELECT post_resposta.*, usuario.nickname 
            FROM post_resposta 
            INNER JOIN usuario ON post_resposta.id_usuario = usuario.id_usuario
            WHERE id_post_resposta='$respostaId'");
        return $res->fetch();
    }

    public static function criarResposta($id_post, $id_usuario, $conteudo, $anexo = '', $likes = 0) {
        $banco = Banco::getConn();
        $res = $banco->prepare("INSERT INTO post_resposta (id_post, id_usuario, conteudo, data_postagem, anexo, likes) VALUES (:id_post, :id_usuario, :conteudo, current_timestamp(), :anexo, :likes)");
        return $res->execute([
            ':id_post' => $id_post,
            ':id_usuario' => $id_usuario,
            ':conteudo' => $conteudo,
            ':anexo' => $anexo,
            ':likes' => $likes
        ]);
    }   

    public static function editarResposta($id_post_resposta, $conteudo, $anexo) {
        $banco = Banco::getConn();
        $res = $banco->prepare("UPDATE post_resposta SET conteudo = :conteudo, anexo = :anexo WHERE id_post_resposta = :id_post_resposta");
        return $res->execute([
            ':conteudo' => $conteudo,
            ':anexo' => $anexo,
            ':id_post_resposta' => $id_post_resposta
        ]);
    }

    public static function apagarResposta($id_post_resposta) {
        $banco = Banco::getConn();
        $res = $banco->prepare("DELETE FROM post_resposta WHERE id_post_resposta = :id_post_resposta");
        return $res->execute([':id_post_resposta' => $id_post_resposta]);
    }

    public static function likeResposta($idResposta, $idUsuario) {
        $banco = Banco::getConn();
        $res = $banco->prepare("UPDATE post_resposta SET likes = likes + 1 WHERE id_post_resposta = :id_post_resposta");
        $res->execute([':id_post_resposta' => $idResposta]);
    }
}