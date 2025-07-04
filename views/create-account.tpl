% rebase('layout', title='Formulário Usuário')
<img style="width: 350px;" src="http://localhost:8080/static/img/logo OO.png">

<div class="create-account-container">
    

    <h1>Crie sua Conta</h1>
    
    <form action="/users/create-account" method="post">
        <div class="form-group">
            <label for="name">Nome:</label>
            <input type="text" id="name" name="name" required 
                   value="{{user.name if user else ''}}">
        </div>
        
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required 
                   value="{{user.email if user else ''}}">
        </div>
        
        <div class="form-group">
            <label for="birthdate">Data de Nascimento:</label>
            <input type="date" id="birthdate" name="birthdate" required 
                   value="{{user.birthdate if user else ''}}">
        </div>

        <div class="form-group">
            <label for="password">Senha:</label>
            <input type="password" id="password" name="password" required>
        </div>
        
        <div class="form-actions">
            <button type="submit" class="btn-submit">Cadastrar</button>
        </div>
        <div class="signup-link">
            <a href="/home">
                Já tem uma conta? Faça login aqui
            </a>
        </div>
        
    </form>
    
</div>