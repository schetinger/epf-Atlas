<!DOCTYPE html>
<html lang="pt-br">
%include ('perfil')

<head>
    <title>Home</title>
    <style>
        body { font-family: sans-serif; max-width: 800px; margin: auto; padding: 20px; background-color: rgb(255, 255, 255) }
        
        .post-box { background-color: rgb(0, 9, 30); border: 1px solid rgb(28, 28, 28); padding: 20px; margin-bottom: 25px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); }
        textarea { width: 100%; box-sizing: border-box; min-height: 80px; padding: 10px; border-radius: 8px; border: 1px solid #ccc; font-size: 16px;}
        button { background-color: #1877f2; color: white; padding: 10px 20px; border: none; border-radius: 20px; font-weight: bold; cursor: pointer; font-size: 16px;float: right; margin-top: 10px;}
        
        .timeline h2 { border-bottom: 1px solid #ddd; padding-bottom: 10px; }
        
        .post { background-color: white; border: 1px solid #ddd; padding: 15px; margin-bottom: 15px; border-radius: 8px; }
        
        .post p { margin: 0; font-size: 1.1em; }
        
        .post small { color: #888; font-size: 0.8em; }
        
        .fundo-amarelo-degrade {
            background-image: linear-gradient(
                to top, 
                transparent, 
                rgba(16, 76, 106, 0.588)
            );
            width: 100%;
            height: 1000px;
            padding: 20px;
            border-radius: 10px;
            box-sizing: border-box; /* Garante que o padding não aumente o tamanho */
            color: #1c1c1c;
            font-family: sans-serif;
            font-size: 1.2em;
       }
        </div>
    </style>
</head>
<body class="fundo-amarelo-degrade">

    <div class="post-box">

    
        <h2>Criar Publicação</h2>
        <form action="/home/add" method="post">
            <textarea name="texto_postagem" placeholder="Comentário sobre a viagem?" required></textarea>
            <br>
            <div> 
             <label>Sua avaliação:</label>

             <br>

             <input type ="radio" value="1" name="avaliacao" id="estrela1" required> <label for="estrela1" required> 1⭐</label>
             <input type ="radio" value="2" name="avaliacao" id="estrela2" required> <label for="estrela2"> 2⭐ </label>
             <input type ="radio" value="3" name="avaliacao" id="estrela3" required> <label for="estrela3"> 3⭐ </label>
             <input type ="radio" value="4" name="avaliacao" id="estrela4" required> <label for="estrela4"> 4⭐ </label>
             <input type ="radio" value="5" name="avaliacao" id="estrela5" required> <label for="estrela5"> 5⭐ </label>
            </div>
            <br>
            <button type="submit">Publicar</button>
        </form>

        
            
            
            

            

    </div>
    <div class="identificacao">
        <h3>esse é seu id {{user_id}}</h3>

    <div class="timeline">
        <h2>Sua Timeline</h2>
        
        % for post in posts:
        <div class="post">
            <p>{{ post.texto }}</p>
            <div>
                <strong> Avaliação: </strong> {{ post.avaliacao }} 
                 </div>
            <small>Publicado em: {{ post.criado_em.split('T')[0] }}</small>
             
        </div>
        % end

        % if not posts:
            <p>Nenhuma publicação encontrada. Seja o primeiro a publicar algo!</p>
        % end
    </div>
   

</body>
</html>