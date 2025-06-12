<?php
include __DIR__ . '/../layout/header.php';
include __DIR__ . '/../layout/cards.php';
?>
<div class="container py-4">
    <div class="row">
        <div class="col-12 mb-4">
            <div class="d-flex flex-wrap gap-2 justify-content-center">
                <?php foreach ($topicos as $t): ?>
                <a href="/php-twitter/explorar?topico=<?= $t['id_topico'] ?>" class="btn btn-outline-primary rounded-pill px-4 py-2
                        <?=(isset($idTopico) && $idTopico == $t['id_topico']) ? 'active fw-bold' : ''?>">
                    <?= htmlspecialchars($t['nome']) ?>
                </a>
                <?php endforeach; ?>
            </div>
        </div>
        <div class="col-md-12">
            <?php if ($idTopico): ?>
            <h5 class="text-center fw-bold text-primary mb-4">Posts em
                <?= htmlspecialchars($topicoAtual['nome'] ?? '') ?></h5>
            <div class="row justify-content-center">
                <?php if (!empty($posts)): ?>
                <?php foreach ($posts as $post) cardPost(
                        $post['id_post'],
                        $post['id_usuario'],
                        $post['nickname'],
                        $post['conteudo'],
                        $post['data_postagem'],
                        $post['anexo'],
                        $post['likes'],
                        false
                    ); ?>
                <?php else: ?>
                <div class="text-muted">Nenhum post neste tópico.</div>
                <?php endif; ?>
            </div>
            <?php else: ?>
            <div class="text-muted">Escolha um tópico para visualizar os posts.</div>
            <?php endif; ?>
        </div>
    </div>
</div>
<?php include __DIR__ . '/../layout/footer.php'; ?>