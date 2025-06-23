from bottle import Bottle, request, template, redirect
from .base_controller import BaseController
from services.home_service import HomeService
import json

class HomeController(BaseController):
    def __init__(self, app):
        super().__init__(app)
        self.home_service = HomeService()
        self.setup_routes()

    def setup_routes(self):
        self.app.route('/home', method='GET', callback=self.render_home)
        
        self.app.route('/home/add', method='POST', callback=self.add_item)

    def render_home(self):
        
        items = self.home_service.get_all()
        
        return self.render('home', posts=items)

    def add_item(self):
       
        texto = request.forms.get('texto_postagem')
        self.home_service.create_item(texto)
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