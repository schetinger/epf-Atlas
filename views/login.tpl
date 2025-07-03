% # Este template herda de um layout base
% rebase('layout', title='Login')
<img style="width: 350px;" src="http://localhost:8080/static/img/logo OO.png">

<div class="login-container">
    
    
    <h1>Entrar no Sistema</h1>

    <form action="/login" method="post">
        
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder=" seuemail@exemplo.com" required>
        </div>
        
        <div class="form-group">
            <label for="password">Senha:</label>
            <input type="password" id="password" name="password" placeholder="Sua Senha" required>
        </div>
        
        <div class="form-actions">
            <button type="submit" class="btn-submit">Logar</button>
        </div>

        <div class="signup-link">
            <a href="/users/create-account">
                Não tem conta ainda? Cadastre-se aqui
            </a>
        </div>
        
    </form>
</div>