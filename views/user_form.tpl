% rebase('layout', title='Formulário Usuário')

<section class="form-section">
    <h1>{{'Editar Usuário' if user else 'Adicionar Usuário'}}</h1>
    
    <form action="{{action}}" method="post" class="form-container">
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
      %if not user:
         <div class="form-group">
            <label for="password">Senha:</label>
            <input type="password" id="password" name="password" required>
            </div>
            %end

        %if user:
         </div class="button-group">
           <input type="radio" id="is_admin_true" name="admin" value="True"
           % if user.admin:
              checked
           % end
             >
          <label for="is_admin_true">Administrador</label>

         <input type="radio"  id="is_admin_false" name="admin" value="False"
           % if not user.admin:
               checked
           % end
             >
         <label for="is_admin_false">Usuário</label>
        %else:
            </div class="button-group">
            <input type="radio" id="is_admin_true" name="admin" value="True">
            <label for="is_admin_true">Administrador</label>

         <input type="radio"  id="is_admin_false" name="admin" value="False" checked>
         <label for="is_admin_false">Usuário</label>
            %end
        
        <div class="form-actions">
            <button type="submit" class="btn-submit">Salvar</button>
            <a href="/users" class="btn-cancel">Voltar</a>
        </div>
    </form>
</section>