<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Twitter</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.11.3/font/bootstrap-icons.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body
    style="background-color: <?php echo getCookieCustom('tema') === 'escuro' ? '#222' : '#e6ecf0'; ?>; color: <?php echo getCookieCustom('tema') === 'escuro' ? '#f8f9fa' : '#14171a'; ?>; font-family: 'Segoe UI', 'Arial', 'sans-serif';">
    <header class="py-2 shadow-sm <?= $_SESSION['bgLayout'] ?? 'bg-white' ?> border-bottom border-1 border-light-subtle">
        <div class="container">
            <div class="d-flex justify-content-around align-items-center">
                <h1 class="h3 mb-0 d-flex align-items-center">
                    <i class="bi bi-twitter text-primary me-2" style="font-size:2rem;"></i>
                    <a href="/php-twitter/" class="text-decoration-none text-primary fw-bold"
                        style="letter-spacing:-1px;">Twitter</a>
                </h1>
                <nav>
                    <a href="/php-twitter/explorar" class="btn btn-light rounded-pill me-2">Explorar</a>
                    <a href="/php-twitter/pesquisar" class="btn btn-light rounded-pill me-2">Pesquisar</a>
                    <a href="/php-twitter/mensagem" class="btn btn-light rounded-pill me-2">DM</a>
                    <?php if (isset($_SESSION['id_usuario']) && $_SESSION['tipo'] != 'normal') { ?>
                    <a href="/php-twitter/dashboard" class="btn btn-warning rounded-pill me-2">Dashboard</a>
                    <?php } ?>
                </nav>
                <div class="d-flex align-items-center">
                    <?php if (isset($_SESSION['id_usuario'])) { ?>
                    <a href="/php-twitter/usuario"
                        class="me-2 text-secondary ">@<?= strtolower($_SESSION['nickname']) ?></a>
                    <a href="/php-twitter/logout" class="btn btn-light text-danger rounded-pill"> Sair </a>

                    <a href="<?php echo isset($_SESSION['id_usuario']) ? '/php-twitter/post/criar' : '/php-twitter/login'; ?>"
                        class="btn btn-primary rounded-pill ms-2 fw-bold">
                        <i class="bi bi-plus-circle me-1"></i> Tweet
                    </a>

                    <a href="/php-twitter/usuario/editar/<?=$_SESSION['id_usuario']?>"
                        class="btn btn-light rounded-pill ms-2 fw-bold">
                        <i class="bi bi-gear"></i>
                    </a>

                    <?php } else { ?>
                    <a href="/php-twitter/login" class="btn btn-primary rounded-pill ms-2 fw-bold">
                        Entrar
                    </a>
                    <?php } ?>
                </div>
            </div>
        </div>
    </header>