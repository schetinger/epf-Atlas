% # Este template herda de um layout base
% rebase('layout', title='Login')

<section class="form-section">
    <h1>Entrar no Sistema</h1>

    % # O formulário envia os dados para a rota /login com o método POST
    <form action="/login" method="post" class="form-container">
        
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="seuemail@exemplo.com" required>
        </div>
        
        <div class="form-group">
            <label for="password">Senha:</label>
            <input type="password" id="password" name="password" placeholder="Sua Senha" required>
        </div>
        
        <div class="form-actions">
            <button type="submit" class="btn-submit">Entrar</button>
        </div>
    </form>
</section>