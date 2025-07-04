# Projeto Template: POO com Python + Bottle + JSON

Este é um projeto de template educacional voltado para o ensino de **Programação Orientada a Objetos (POO)** do Prof. Lucas Boaventura, Universidade de Brasília (UnB).

Utiliza o microframework **Bottle**. Ideal para uso em disciplinas introdutórias de Engenharia de Software ou Ciência da Computação.

## 💡 Objetivo

Fornecer uma base simples, extensível e didática para construção de aplicações web orientadas a objetos com aplicações WEB em Python, ideal para trabalhos finais ou exercícios práticos.

---

## 🗂 Estrutura de Pastas

```bash
poo-python-bottle-template/
├── app.py # Ponto de entrada do sistema
├── config.py # Configurações e caminhos do projeto
├── main.py # Inicialização da aplicação
├── requirements.txt # Dependências do projeto
├── README.md # Este arquivo
├── controllers/ # Controladores e rotas
├── models/ # Definição das entidades (ex: User)
├── services/ # Lógica de persistência (JSON)
├── views/ # Arquivos HTML (Bottle Templating)
├── static/ # CSS, JS e imagens
├── data/ # Arquivos JSON de dados
└── .vscode/ # Configurações opcionais do VS Code
```


## 📁 Descrição do projeto
Foi realizado um projeto web com base em python um *Diário de viagens* online, onde o principal objetivo é fazer publicações com foto, comentário, avalição e destino, para recordação e futuramente interação com demais usuários. Com perfil personalizável.

## 📁 Diagrama de classes 
![image](https://github.com/user-attachments/assets/b3e1748d-31db-4ef8-a32c-cb8ee1ce9aee)


## 📁 Descrição das Pastas

### `controllers/`
Contém as classes responsáveis por lidar com as rotas da aplicação. Exemplos:
- `user_controller.py`: rotas para listagem, adição, edição e remoção de usuários.
- `base_controller.py`: classe base com utilitários comuns.
- `home_controller.py`:': rotas com os comandos da página principal(adcionar postagens, logout, etc).
- `login_controller.py`::rotas para o login da aplicação, diferenciações de tipo de conta.

### `models/`
Define as classes que representam os dados da aplicação. Exemplo:
- `user.py`: classe `User`, com atributos como `id`, `name`, `email`, etc.
- `home.py`: classe `Home`, com atributos como `texto`,`avaliacao`,`criado_em`.
- `login.py`: classe `Login`, com atributos como `email` e `password`.
- `post.py`: classe `Post`, com atributos como `destination`,`comment`,`rate`, etc.

### `services/`
Responsável por salvar, carregar e manipular dados usando arquivos JSON. Exemplo:
- `user_service.py`: contém métodos como `get_all`, `get_by_id`, `edit_user`.
- `login_service.py`: contém métodos como `validate_login` e `get_user`.
- `home_service.py`: contém métodos como `get_all`, `add_post`, `create_item`.
- `perfil_service.py`: contém métodos como `add_perfil_pic`, `image_exists`, `del_perfil_pic`.

### `views/`
Contém os arquivos `.tpl` utilizados pelo Bottle como páginas HTML:
- `layout.tpl`: estrutura base com navegação e bloco `content`.
- `users.tpl`: lista os usuários.
- `user_form.tpl`: formulário para adicionar/editar usuário.
- `create-account.tpl`: criar cadastro no site.
- `helper.tpl`: helper do professor.
- `login.tpl`: página de login.
- `perfil.tpl`: perfil no home, tpl para mostrar os dados, upload da foto de perfil etc.
- `post.tpl`: dados da caixza de postagem.
- `teste.tpl`: home principal, onde os principais tpl sao adicionados, feed, e perfil.
  

### `static/`
Arquivos estáticos como:
- `css/style.css`: estilos básicos.
- `css/helper.css`: helper do professor.
- `css/login.css`: estilos do login.
- `css/logout.css`: estilo do botão de logout na home.
- `css/perfil.css`: estilos do perfil na home.
- `css/user_subs.css`: estilos da página de cadastro do website.
- `perfil/x.png`: fotos que foram feitas upload de perfil (x sendo número do id).
- `uploads/token.png`: imagens das publicações que foram realizadas.
- `js/main.js`: scripts JS opcionais.
- `img/BottleLogo.png`: exemplo de imagem.
- `img/logo OO.png`: logo página principal.
- `img/perfilPlaceholder.png`: placeholder do perfil quando não há foto.
  





### `data/`
Armazena os arquivos `.json` que simulam o banco de dados:
- `users.json`: onde os dados dos usuários são persistidos.
- `home.json`: onde os arquivos das publicações são persistidos.

---

## ▶️ Como Executar

1. Crie o ambiente virtual na pasta fora do seu projeto:
```bash
python -m venv venv
source venv/bin/activate  # Linux/Mac
venv\\Scripts\\activate     # Windows
```

2. Entre dentro do seu projeto criado a partir do template e instale as dependências:
```bash
pip install -r requirements.txt
```

3. Rode a aplicação:
```bash
python main.py
```

4. Accese sua aplicação no navegador em: [http://localhost:8080](http://localhost:8080)

---

## ✍️ Personalização
Para adicionar novos modelos (ex: Atividades):

1. Crie a classe no diretório **models/**.

2. Crie o service correspondente para manipulação do JSON.

3. Crie o controller com as rotas.

4. Crie as views .tpl associadas.

---

## 🧠 Autor e Licença
Projeto desenvolvido como template didático para disciplinas de Programação Orientada a Objetos, baseado no [BMVC](https://github.com/hgmachine/bmvc_start_from_this).
Você pode reutilizar, modificar e compartilhar livremente.
