<div class="perfil-widget">
    <section class="upload-section">
        <h4>Enviar Imagem de Perfil</h4>

        % if defined('error') and error:
            <p class="widget-message error">{{error}}</p>
        % end
        % if defined('success') and success:
            <p class="widget-message success">{{success}}</p>
        % end
        

        <form action="/upload_imagem" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <img src="http://localhost:8080/static/img/perfilPlaceholder.png">

                <label for="imagem_usuario">Selecione uma imagem:</label>
                <input type="file" id="imagem_usuario" name="imagem_usuario" required>
                
            </div>
            <div class="form-actions">
                <button type="submit">Enviar</button>
            </div>
        </form>
    </section>
    
</div>
<div class="informacoes">
    <h8>Seu email cadastrado é {{user_id}} </h8>




</div>