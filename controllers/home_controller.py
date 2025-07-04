from bottle import Bottle, request, redirect
from .base_controller import BaseController
from services.home_service import HomeService
import json
from models.post import  PostModel
from services.perfil_service import PerfilService
from models.user import UserModel
s = request.environ.get('beaker.session')
class HomeController(BaseController):
    def __init__(self, app):
        super().__init__(app)
        self.setup_routes()

    def setup_routes(self):
        self.app.route('/home', method='GET', callback=self.render_home)
        self.app.route('/home/add', method='POST', callback=self.add_item)
        self.app.route('/home/upload_imagem', method='POST', callback=self.upload_image)
        self.app.route('/home/logout', method='POST', callback=self.logout)
   
    def render_home(self):
        s = request.environ.get('beaker.session')
        
        if s.get('id') is None:
            return redirect('/login')
        else:
         items = PostModel(s.get('id'))
         items = items.get_all()
         users = UserModel()
         user = users.get_by_id(s.get('id'))
         image_exists = PerfilService.image_exists(user.image_path)
         return self.render('teste', posts=items,user=user , image_exists=image_exists)

    def add_item(self):
        s = request.environ.get('beaker.session')
       # post = PostModel(s.get('id'))
        service = HomeService(s.get('id'))
       # post.add_item(service.add_post(user_id=s.get('id')))
        service.add_post(user_id=s.get('id'))
        
        
        #image_file = request.files.get('image')

            
        #service.add_post(image_file=image_file)
        
        return redirect('/home')
        #redirect('/home')

    def upload_image(self):
        users = UserModel()
        s = request.environ.get('beaker.session')
        user = users.get_by_id(s.get('id'))
        perfil = PerfilService()
        if perfil.image_exists(user.image_path):
            perfil.del_perfil_pic(user)
            perfil.add_perfil_pic(user_id=s.get('id'))
            return redirect('/home')
        else:
            perfil.add_perfil_pic(user_id=s.get('id'))
            return redirect('/home')
        
    def logout(self):
            s = request.environ.get('beaker.session')
            s.delete()
            return redirect('/login')
    
   

home_routes = Bottle()
home_controller = HomeController(home_routes)