<?php 
require_once __DIR__ . '/../services/banco.php';

class Mensagem {
    public static function encontrarUsuariosQueEnviaramMensagens($idUsuario) {
        $banco = Banco::getConn();
        $res = $banco->prepare(
            "SELECT u.id_usuario, u.nickname, MAX(m.data_envio) as ultima_mensagem
            FROM usuario u
            INNER JOIN (
                SELECT id_usuario_remetente AS id_usuario, data_envio FROM mensagem_privada WHERE id_usuario_destinatario = :idUsuario
                UNION ALL
                SELECT id_usuario_destinatario AS id_usuario, data_envio FROM mensagem_privada WHERE id_usuario_remetente = :idUsuario
            ) m ON u.id_usuario = m.id_usuario
            WHERE u.id_usuario != :idUsuario
            GROUP BY u.id_usuario, u.nickname
            ORDER BY ultima_mensagem DESC"
        );
        $res->execute([':idUsuario' => $idUsuario]);
        return $res->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function encontrarMensagens($idRemetente, $idDestinatario) {
        $banco = Banco::getConn();
        $res = $banco->prepare(
            "SELECT m.*, u1.nickname AS remetente_nickname, u2.nickname AS destinatario_nickname
            FROM mensagem_privada m 
            JOIN usuario u1 ON m.id_usuario_remetente = u1.id_usuario
            JOIN  usuario u2 ON m.id_usuario_destinatario = u2.id_usuario
            WHERE
            (m.id_usuario_remetente = :remetente AND m.id_usuario_destinatario = :destinatario)
            OR (m.id_usuario_remetente = :destinatario AND m.id_usuario_destinatario = :remetente)
            ORDER BY m.data_envio ASC");
        $res->execute([
            ':remetente' => $idRemetente,
            ':destinatario' => $idDestinatario
        ]);
        return $res->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function encontrarMensagemPorId($idMensagem) {
        $banco = Banco::getConn();
        $res = $banco->prepare("SELECT * FROM mensagem_privada WHERE id_mensagem_privada = :idMensagem");
        $res->execute([':idMensagem' => $idMensagem]);
        return $res->fetch();
    }

    public static function criarMensagem($idRemetente, $idDestinatario, $conteudo) {
        $banco = Banco::getConn();
        $res = $banco->prepare(
            "INSERT INTO mensagem_privada (id_usuario_remetente, id_usuario_destinatario,
            conteudo, data_envio) VALUES (:remetente, :destinatario, :conteudo, current_timestamp())");
        return $res->execute([
            ':remetente' => $idRemetente,
            ':destinatario' => $idDestinatario,
            ':conteudo' => $conteudo
        ]);
    }

    public static function editarMensagem($idMensagem, $conteudo) {
        $banco = Banco::getConn();
        $res = $banco->prepare("UPDATE mensagem_privada SET conteudo = :conteudo WHERE id_mensagem_privada = :idMensagem");
        return $res->execute([
            ':conteudo' => $conteudo,
            ':idMensagem' => $idMensagem
        ]);
    }

    public static function apagarMensagem($idMensagem) {
        $banco = Banco::getConn();
        $res = $banco->prepare("DELETE FROM mensagem_privada WHERE id_mensagem_privada = :idMensagem");
        return $res->execute([':idMensagem' => $idMensagem]);
    }
}