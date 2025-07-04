<!DOCTYPE html>
<html lang="pt-br">
    
<head>
    <meta charset="UTF-8">
    <title>Diário de Viagens</title>

    <link rel="stylesheet" href="/static/css/perfil.css">
    <link rel="stylesheet" href="/static/css/logout.css">
    
    <style>
        /* Estilos gerais para a página */
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            background-color: #001331;
            color: #ffffff;
            margin: 0;
            padding: 20px;
            display: block;
            flex-direction: row;
            gap : 10px;
        }
        .container {
            max-width: 50%; /*800px*/
            min-width: 50%;
            margin: 0 auto;
            background-color: #000b1c;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        /* Estilo para a seção do formulário */
        .form-section {
            border-bottom: 1px solid #dddfe2;
            padding-bottom: 20px;
            margin-bottom: 20px;
        }
        .form-section h2 {
            font-size: 24px;
            color: #1877f2;
        }
        .form-group {
            margin-bottom: 15px;
            
        }
        .form-group label {
            display: block;
            font-weight: 600;
            margin-bottom: 5px;
        }
        .form-group input[type="text"],
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #dddfe2;
            border-radius: 6px;
            box-sizing: border-box; /* Garante que o padding não aumente a largura */
            
            padding: 12px;
            box-sizing: border-box;
    
            background-color: #1c2b41; /* <-- É ESTA AQUI */

            border: 1px solid #334e75;
            border-radius: 6px;
            color: #FFFFFF; /* Define a cor do texto que você digita (branco) */
            font-size: 16px;
            transition: all 0.2s ease-in-out;
        }
        .form-group textarea {
            min-height: 80px;
            resize: vertical; width: 100%;
            padding: 12px;
            box-sizing: border-box;
    
            background-color: #1c2b41; /* <-- É ESTA AQUI */

            border: 1px solid #334e75;
            border-radius: 6px;
            color: #FFFFFF; /* Define a cor do texto que você digita (branco) */
            font-size: 16px;
            transition: all 0.2s ease-in-out;
        }
        .form-group button {
            background-color: #1877f2;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 9999px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            
        }
        .form-group button:hover {
            background-color: #166fe5;
        }
        .form-group input {
        width: 100%;
        padding: 12px;
        box-sizing: border-box;
    
        background-color: #1c2b41; /* <-- É ESTA AQUI */

        border: 1px solid #334e75;
        border-radius: 6px;
        color: #FFFFFF; /* Define a cor do texto que você digita (branco) */
        font-size: 16px;
        transition: all 0.2s ease-in-out;
        }

        /* Estilo para a seção do Feed */
        .feed-section h2 {
            font-size: 24px;
        }
        .post-card {
            border: 1px solid #dddfe2;
            border-radius: 8px;
            margin-bottom: 20px;
            padding: 15px;
            overflow: hidden; /* Garante que o conteúdo não vaze */
        }
        .post-card img {
            width: 100%;
            height: auto;
            border-radius: 8px;
            margin-bottom: 15px;
        }
        .post-card h3 {
            margin: 0 0 10px 0;
            font-size: 20px;
        }
        .post-card .rating {
            color: #f5c518; /* Cor de estrela */
            font-size: 18px;
            margin-bottom: 10px;
             width: 100%;
            padding: 12px;
            box-sizing: border-box;
    
            background-color: #1c2b41; /* <-- É ESTA AQUI */

            border: 1px solid #334e75;
            border-radius: 6px;
            color: #FFFFFF; /* Define a cor do texto que você digita (branco) */
            font-size: 16px;
            transition: all 0.2s ease-in-out;
        }
        .post-card .comment {
            margin-bottom: 10px; width: 100%;
            padding: 12px;
            
    
            
        }
        .post-card .author {
            font-size: 12px;
            color: #65676b;
        }
        
        
       
        
    </style>
</head>
<body>
    %include('perfil')
    

    <div class="container">
        
        <section class="form-section">
            <h2>Criar Novo Post de Viagem</h2>
            <form action="/home/add" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="destination">Destino:</label>
                    <input type="text" id="destination" name="destination" placeholder="Ex: Pirenópolis, GO" required>
                </div>

                <div class="form-group">
                    <label for="rate">Sua Avaliação (de 1 a 5):</label>
                    <select id="rate" name="rate" required>
                        <option value="5">⭐⭐⭐⭐⭐ (Excelente)</option>
                        <option value="4">⭐⭐⭐⭐ (Muito Bom)</option>
                        <option value="3" selected>⭐⭐⭐ (Bom)</option>
                        <option value="2">⭐⭐ (Regular)</option>
                        <option value="1">⭐ (Ruim)</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="comment">Comentário:</label>
                    <textarea id="comment" name="comment" rows="4" placeholder="Descreva sua experiência..." required></textarea>
                </div>

                <div class="form-group">
                    <label for="image">Adicionar Imagem:</label>
                    <input type="file" id="image" name="image" accept="image/*" required>
                </div>

                <div class="form-group">
                    <button type="submit">Publicar</button>
                </div>
            </form>
        </section>

        <section class="feed-section">
            <h2>Feed de Viagens</h2>

            % if defined('posts') and posts:
                % for post in posts:
                    <div class="post-card">
                        <img src="http://localhost:8080/static/uploads/{{post.image}}" alt="Foto de {{post.destination}}">
                        
                        <h3>{{post.destination}}</h3>
                        
                        <div class="rating">
                            % for i in range(int(post.rate)):
                                ⭐
                            % end
                        </div>

                        <p class="comment">{{post.comment}}</p>

                        <p class="author">Postado por: {{user.name}}</p>
                    </div>
                % end
            % else:
                <p>Ainda não há nenhuma publicação. Seja o primeiro a criar!</p>
            % end
        </section>
    </div>
    <div class="logout-widget">
        <form action="/home/logout" method="post">
                <div class="form-group">
                    <button type="submit">Logout</button>
                </div>
         </form>

        %if user.admin:
        <form action="/users" method="get">
            <div class="form-group">
                <button type="submit">Gerenciar Usuários</button>
        %end
        </form>
    </div>
    
    
    <!--tmhl do logout se der errado o outro-->
   <!-- form action="/home/logout" method="post">
                  <div class="form-group">
                    <button type="submit">Logout</button>
                </div>
            </form>

    %if user.admin:
    <form action="/users" method="get">
        <div class="form-group">
        <button type="submit">Gerenciar Usuários</button>
        %end
    </form -->




</body>
</html>