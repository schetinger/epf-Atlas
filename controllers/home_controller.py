from bottle import Bottle, request, template, redirect
from .base_controller import BaseController
from services.home_service import HomeService
import json
from beaker.middleware import SessionMiddleware
from models.post import Post, PostModel
s = request.environ.get('beaker.session')
class HomeController(BaseController):
    def __init__(self, app):
        super().__init__(app)
        self.setup_routes()

    def setup_routes(self):
        self.app.route('/home', method='GET', callback=self.render_home)
        
        self.app.route('/home/add', method='POST', callback=self.add_item)

    def render_home(self):
        s = request.environ.get('beaker.session')
        items = PostModel(s.get('id'))
        items = items.get_all()
        return self.render('teste', posts=items, user_id=s.get('id'))

    def add_item(self):
        s = request.environ.get('beaker.session')
       # post = PostModel(s.get('id'))
        service = HomeService(s.get('id'))
       # post.add_item(service.add_post(user_id=s.get('id')))
        service.add_post(user_id=s.get('id'))
        return redirect('/home')
        #redirect('/home')

    
    def upload_foto_perfil(self):
        """Recebe o arquivo da foto, salva e retorna um JSON com o novo caminho."""
        pic_file = request.files.get('foto_perfil')

        if pic_file:
            # O service agora retorna o novo nome do arquivo
            novo_filename = self.user_service.change_profile_picture(pic_file)
            
            if novo_filename:
                # Se deu tudo certo, responde com sucesso e o novo caminho da imagem
                return json.dumps({
                    'success': True,
                    'newImageUrl': f'/static/fotos_perfil/{novo_filename}'
                })
        
        # Se algo deu errado (ex: nenhum arquivo enviado)
        return json.dumps({'success': False, 'error': 'Nenhum arquivo válido enviado.'})    

home_routes = Bottle()
home_controller = HomeController(home_routes)