<div class="perfil-widget">
    
    
    <section class="upload-section">
        <h4>Perfil</h4>
        
        %if not image_exists:
        <img style="width:100%" src="http://localhost:8080/static/img/perfilPlaceholder.png">
        %else:
        <img style="width:100%" src="http://localhost:8080/static/perfil/{{user.image_path}}">
        %end
        <!-- 200px-->

       

        <form action="/home/upload_imagem" method="post" enctype="multipart/form-data">
            <div class="form-group">
             
                <!-- img src="http://localhost:8080/static/img/perfilPlaceholder.png"-->

                <label for="imagem_usuario">Selecione uma imagem:</label>
                <input type="file" id="imagem_usuario" name="imagem_usuario" required>
                
            </div>
            <div class="form-actions">
                <button type="submit">Enviar</button>
            </div>
        </form>
        <div class="informacoes">
            <p class="info-linha"><strong>Nome:</strong> {{user.name}}</p>
            <p class="info-linha"><strong>Seu email cadastrado é:</strong> {{user.email}}</p>
            <p class="info-linha"><strong>Data de nascimento:</strong> {{user.birthdate}}</p>
            <p class="info-linha"><strong>ID:</strong> {{user.id}}</p>




        </div>
    </section>
    
</div>
