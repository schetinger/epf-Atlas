<!DOCTYPE html>
<html>
<head>
    <title>Lista de Usuários</title>
</head>
<body>

    <h1>Usuários Carregados</h1>

    <ul>
        % # A variável 'home' é a lista de objetos que o controller passou
        % for item in home:
            <li>Usuário ID: {{item.user}}</li>
        % end
    </ul>

</body>
</html>