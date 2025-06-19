% rebase('layout', title='Enviar Imagem')

<section class="upload-section">
    <h2>Enviar uma Imagem de Perfil</h2>

    % if defined('error'):
        <p style="color: red;"><strong>Erro:</strong> {{error}}</p>
    % end
    % if defined('success'):
        <p style="color: green;">{{success}}</p>
    % end

    <form action="/upload_imagem" method="post" enctype="multipart/form-data">
        
        <div class="form-group">
            <label for="imagem_usuario">Selecione uma imagem:</label>
            
            <input type="file" id="imagem_usuario" name="imagem_usuario" accept="image/png, image/jpeg, image/gif" required>
        </div>
        
        <div class="form-actions">
            <button type="submit">Enviar Imagem</button>
        </div>
        
    </form>
</section>