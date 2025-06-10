<?php
require_once __DIR__ . '/../../services/session.php';

include __DIR__ . '/../layout/header.php';
?>
<div class="container mt-4">
    <h1 class="text-center">Login</h1>
    <?php if (!empty($error_message)): ?>
    <div class="alert alert-danger" role="alert">
        <?php echo htmlspecialchars($error_message); ?>
    </div>
    <?php endif; ?>
    <form method="POST" action="" class="mt-4 col-md-8 mx-auto">
        <div class="mb-3">
            <label for="email" class="form-label">Email de Usuário:</label>
            <input type="text" id="email" name="email" class="form-control rounded-pill" required>
        </div>
        <div class="mb-5">
            <label for="senha" class="form-label">Senha:</label>
            <input type="password" id="senha" name="senha" class="form-control rounded-pill" required>
        </div>
        <div class="d-flex justify-content-between align-items-center">
            <button type="submit" class="btn btn-primary rounded-pill">Entrar</button>
            <a href="/php-twitter/recuperar-senha" class="small text-muted">Esqueceu a Senha?</a>
            <a href="/php-twitter/cadastro" class="btn btn-outline-primary rounded-pill">Crie sua Conta</a>
        </div>
        <div class="bg-warning p-3 rounded-pill mt-4 text-center">
            Houve um vazamento no sistema! Todas as senhas são: senha123.
            <br>
            Por favor não acessar a conta do admin1@email.com
        </div>
    </form>
</div>
<?php include __DIR__ . '/../layout/footer.php'; ?>