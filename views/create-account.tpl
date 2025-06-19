% rebase('layout', title='Formulário Usuário')

<section class="form-section">
    
    <form action="/users/create-account" method="post" class="form-container">
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
            <input type="password" id="password" name="password" required 
                   value="{{user.password if user else ''}}">
        </div>
        
        <div class="form-actions">
            <button type="submit" class="btn-submit">Cadastar</button>
        </div>
    </form>
</section>