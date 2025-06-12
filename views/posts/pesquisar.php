
<?php
include __DIR__ . '/../../views/layout/header.php';
include __DIR__ . '/../../views/layout/cards.php';

$busca = $busca ?? '';
$usuarios = $usuarios ?? [];
$posts = $posts ?? [];
?>
             
<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-sm border-0 rounded-4 mb-4">
                <div class="card-body p-4">
                    <form method="get" class="d-flex align-items-center gap-2" role="search" aria-label="Formulário de busca">
                        <input
                            type="text"
                            class="form-control rounded-pill"
                            name="q"
                            placeholder="Buscar posts ou usuários..."
                            value="<?php echo htmlspecialchars($busca); ?>"
                            autofocus
                            required
                            aria-label="Campo de busca por posts ou usuários"
                        >
                        <button class="btn btn-primary rounded-pill fw-bold" type="submit" aria-label="Buscar">
                            <i class="bi bi-search" style="font-size:1.5rem;"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <?php if (!empty($busca)): ?>
        <div class="row justify-content-center mb-4">
            <div class="col-md-8">
                <h5 class="fw-bold text-primary mb-3">Usuários encontrados</h5>

                <?php if (count($usuarios) > 0): ?>
                    <ul class="list-group mb-4">
                        <?php foreach ($usuarios as $u): ?>
                            <li class="list-group-item d-flex align-items-center">
                                <i class="bi bi-person-circle text-secondary me-3" style="font-size:2rem;"></i>
                                <div class="flex-grow-1">
                                    <a href="/php-twitter/usuario/<?php echo $u['id_usuario']; ?>"
                                       class="fw-bold text-primary text-decoration-none">
                                        @<?php echo strtolower(htmlspecialchars($u['nickname'])); ?>
                                    </a>
                                    <div class="text-muted small">
                                        <?php echo htmlspecialchars($u['bio']); ?>
                                    </div>
                                </div>
                            </li>
                        <?php endforeach; ?>
                    </ul>
                <?php else: ?>
                    <div class="text-muted mb-4">Nenhum usuário encontrado.</div>
                <?php endif; ?>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-8">
                <hr>
                <h5 class="fw-bold text-primary mb-3">Posts encontrados</h5>
                <div class="row justify-content-center">
                    <?php if (count($posts) > 0): ?>
                        <?php foreach ($posts as $post): ?>
                            <?php cardPost(
                                $post['id_post'],
                                $post['id_usuario'],
                                $post['nickname'],
                                $post['conteudo'],
                                $post['data_postagem'],
                                $post['anexo'],
                                $post['likes'],
                                false
                            ); ?>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <div class="text-muted mb-4">Nenhum post encontrado.</div>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    <?php else: ?>
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="text-muted mb-4">Pesquise já digitando um termo acima.</div>
            </div>
        </div>
    <?php endif; ?>
</div>

<?php include __DIR__ . '/../../views/layout/footer.php'; ?>
