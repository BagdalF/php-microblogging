<?php 
require_once __DIR__ . '/../services/banco.php';
require_once __DIR__ . '/../services/session.php';

class Usuario {
        public static function encontrarUsuarios() {
        $banco = Banco::getConn();
        $res = $banco->prepare("SELECT id_usuario, tipo, nickname, email, bio FROM usuario ORDER BY id_usuario DESC");
        $res->execute();
        return $res->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function encontrarUsuario($idUsuario) {
        $banco = Banco::getConn();
        $res = $banco->prepare("SELECT id_usuario, tipo, nickname, email, bio FROM usuario WHERE id_usuario = :id_usuario");
        $res->execute([':id_usuario' => $idUsuario]);
        return $res->fetch(PDO::FETCH_ASSOC);
    }

    public static function encontrarUsuarioPorNickname($nickname) {
        $banco = Banco::getConn();
        $res = $banco->prepare("SELECT id_usuario, tipo, nickname, email, bio FROM usuario WHERE nickname = :nickname");
        $res->execute([':nickname' => $nickname]);
        return $res->fetch(PDO::FETCH_ASSOC);
    }

    public static function criarUsuario($tipo, $nickname, $email, $senha, $data_nascimento, $cpf, $bio = '' ) {
        $banco = Banco::getConn();
        $senha_hash = password_hash($senha, PASSWORD_DEFAULT);
        $res = $banco->prepare("INSERT INTO usuario (tipo, nickname, email, senha, bio, data_nascimento, cpf) VALUES (:tipo, :nickname, :email, :senha, :bio, :data_nascimento, :cpf)");
        return $res->execute([
            ':tipo' => $tipo,
            ':nickname' => $nickname,
            ':email' => $email,
            ':senha' => $senha_hash,
            ':bio' => $bio,
            ':data_nascimento' => $data_nascimento,
            ':cpf' => $cpf
        ]);
    }

    public static function editarUsuario($idUsuario, $nickname, $email, $bio, $tipo) {
        $banco = Banco::getConn();
        $res = $banco->prepare("UPDATE usuario SET nickname = :nickname, email = :email, bio = :bio, tipo = :tipo WHERE id_usuario = :id_usuario");
        return $res->execute([
            ':nickname' => $nickname,
            ':email' => $email,
            ':bio' => $bio,
            ':tipo' => $tipo,
            ':id_usuario' => $idUsuario
        ]);
    }

    public static function editarSenhaUsuario($idUsuario, $novaSenha) {
        $banco = Banco::getConn();
        $res = $banco->prepare("UPDATE usuario SET senha = :senha WHERE id_usuario = :id_usuario");
        return $res->execute([
            ':senha' => password_hash($novaSenha, PASSWORD_DEFAULT),
            ':id_usuario' => $idUsuario
        ]);
    }

    public static function banirUsuario($idUsuario) {
        $banco = Banco::getConn();
        $res = $banco->prepare("DELETE FROM usuario WHERE id_usuario = :id_usuario");
        return $res->execute([':id_usuario' => $idUsuario]);
    }

    public static function authenticate($email, $senha_inserida) {
        $banco = Banco::getConn();
        $res = $banco->prepare("SELECT * FROM usuario WHERE email = :email LIMIT 1");
        $res->bindParam(':email', $email);
        $res->execute();
        $resp = $res->fetch();

        if ($resp) {
            $verificarSenha = password_verify($senha_inserida, $resp['senha']);
            if ($verificarSenha) {
                $_SESSION['id_usuario'] = $resp['id_usuario'] ?? null;
                $_SESSION['nickname'] = $resp['nickname'] ?? null;
                $_SESSION['tipo'] = $resp['tipo'] ?? null;
                return true;
            }
        }
        return false;
    }

    public static function verificarRecuperarSenha($data_nascimento, $cpf) {
        $banco = Banco::getConn();
        $res = $banco->prepare("SELECT * FROM usuario WHERE data_nascimento = :data_nascimento AND cpf = :cpf LIMIT 1");
        $res->bindParam(':data_nascimento', $data_nascimento);
        $res->bindParam(':cpf', $cpf);
        $res->execute();
        return $res->fetch();
    }

    public static function pesquisarUsuarios($busca) {
        $banco = Banco::getConn();
        $res = $banco->prepare("SELECT id_usuario, nickname, bio FROM usuario WHERE nickname LIKE :busca OR bio LIKE :busca");
        $res->execute([':busca' => "%$busca%"]);
        return $res->fetchAll(PDO::FETCH_ASSOC);
    }
}