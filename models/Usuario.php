<?php 
require_once __DIR__ . '/../services/banco.php';
require_once __DIR__ . '/../services/session.php';

class Usuario {
    public static function encontrarUsuarios() {
        $banco = Banco::getConn();
        $stmt = $banco->query("SELECT id_usuario, tipo, nickname, email, bio FROM usuario 
            ORDER BY id_usuario DESC");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function encontrarUsuario($idUsuario) {
        $banco = Banco::getConn();
        $stmt = $banco->query("SELECT id_usuario, tipo, nickname, email, bio FROM usuario 
            WHERE id_usuario='$idUsuario'");
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public static function encontrarUsuarioPorNickname($nickname) {
        $banco = Banco::getConn();
        $stmt = $banco->query("SELECT id_usuario, tipo, nickname, email, bio FROM usuario 
            WHERE nickname='$nickname'");
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public static function criarUsuario($tipo, $nickname, $email, $senha, $bio = '') {
        $banco = Banco::getConn();
        $senha_hash = password_hash($senha, PASSWORD_DEFAULT);
        $stmt = $banco->prepare("INSERT INTO usuario (tipo, nickname, email, senha, bio) VALUES (:tipo, :nickname, :email, :senha, :bio)");
        return $stmt->execute([
            ':tipo' => $tipo,
            ':nickname' => $nickname,
            ':email' => $email,
            ':senha' => $senha_hash,
            ':bio' => $bio
        ]);
    }

    public static function editarUsuario($idUsuario, $nickname, $email, $bio) {
        $banco = Banco::getConn();
        $stmt = $banco->prepare("UPDATE usuario SET nickname = :nickname, email = :email, bio = :bio WHERE id_usuario = :id_usuario");
        return $stmt->execute([
            ':nickname' => $nickname,
            ':email' => $email,
            ':bio' => $bio,
            ':id_usuario' => $idUsuario
        ]);
    }

    public static function banirUsuario($idUsuario) {
        $banco = Banco::getConn();
        $stmt = $banco->prepare("DELETE FROM usuario WHERE id_usuario = :id_usuario");
        return $stmt->execute([':id_usuario' => $idUsuario]);
    }

    public static function authenticate($email, $senha_inserida) {
        $banco = Banco::getConn();
        $stmt = $banco->prepare("SELECT * FROM usuario WHERE email = :email LIMIT 1");
        $stmt->bindParam(':email', $email);
        $stmt->execute();
        $resp = $stmt->fetch();

        if ($resp) {
            $verificarSenha = password_verify($senha_inserida, $resp['senha']);
            if ($verificarSenha) {
                $_SESSION['id_usuario'] = $resp['id_usuario'] ?? null;
                $_SESSION['nickname'] = $resp['nickname'] ?? null;
                $_SESSION['tipo'] = $resp['tipo'] ?? null;
                return true;
            } else  {
                var_dump("Senha incorreta");
            }
        }
        return false;
    }
}