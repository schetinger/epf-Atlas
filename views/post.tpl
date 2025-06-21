<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Minha Timeline</title>
    <style>
        body { font-family: sans-serif; max-width: 800px; margin: auto; padding: 20px; }
        .post-box { border: 1px solid #ccc; padding: 15px; margin-bottom: 20px; border-radius: 8px; }
        textarea { width: 100%; min-height: 80px; padding: 10px; border-radius: 8px; border: 1px solid #ccc; }
        button { background-color: #1DA1F2; color: white; padding: 10px 15px; border: none; border-radius: 20px; font-weight: bold; cursor: pointer; }
        .post { border-bottom: 1px solid #eee; padding: 15px 0; }
        .post p { margin: 0; }
        .post small { color: #888; }
    </style>
</head>
<body>

    <h1>O que está acontecendo?</h1>

    <div class="post-box">
        <form action="/add_post" method="post">
            <textarea name="post_text" placeholder="Escreva sua postagem aqui..." required></textarea>
            <br><br>
            <button type="submit">Postar</button>
        </form>
    </div>

    <hr>

    <h2>Timeline</h2>

    % for post in posts:
    <div class="post">
        <p>{{ post.texto }}</p>
        <small>Postado em: {{ post.criado_em.split('T')[0] }}</small>
    </div>
    % end

    % if not posts:
        <p>Ainda não há nenhuma postagem. Seja o primeiro!</p>
    % end

</body>
</html>