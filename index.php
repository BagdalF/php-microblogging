<?php

include 'functions/helpers.php';

$url = $_GET['url'] ?? null;
$url = explode("/", $url);
// print_r($url);
$pagina =  $url[0];

if (isset($url[1]) && !is_numeric($url[1])) {
    $pagina = "{$url[0]}/$url[1]";
}

require __DIR__ . '/controllers/AuthController.php';
require __DIR__ . '/controllers/PostController.php';
require __DIR__ . '/controllers/RespostaController.php';
require __DIR__ . '/controllers/MensagemController.php';

match ($pagina) {
    'login'                     => AuthController::login(),
    'logout'                    => AuthController::logout(),
    'usuario'                   => AuthController::usuario(),
    'cadastro'                  => AuthController::cadastro(),
    'dashboard'                 => AuthController::dashboard(),
    'usuario/editar'            => AuthController::editarUsuario($url[2]),
    'usuario/banir'             => AuthController::banirUsuario($url[2]),

    'post'                      => PostController::index(),
    'post/explorar'             => PostController::explorar(),
    'post/pesquisar'            => PostController::pesquisar(),
    'post/criar'                => PostController::criarPost(),
    'post/editar'               => PostController::editarPost($url[2]),
    'post/apagar'               => PostController::apagarPost($url[2]),

    'resposta'                  => RespostaController::encontrarRespostas($url[1]),
    'resposta/criar'            => RespostaController::criarResposta($url[2]),
    'resposta/editar'           => RespostaController::editarResposta($url[2]),
    'resposta/apagar'           => RespostaController::apagarResposta($url[2]),

    // 'topico'                 => TopicoController::encontrarTopico($url[2]),
    // 'topico/criar'           => TopicoController::criarTopico($url[2]),
    // 'topico/editar'          => TopicoController::editarTopico($url[2]),
    // 'topico/apagar'          => TopicoController::apagarTopico($url[2]),

    'mensagem'                  => MensagemController::encontrarMensagem($url[1] ?? null),
    'mensagem/editar'           => MensagemController::editarMensagem($url[2]),
    'mensagem/apagar'           => MensagemController::apagarMensagem($url[2]),

    default                     => PostController::index(),
};

exit;