from bottle import Bottle, request, template, redirect
from .base_controller import BaseController
from services.home_service import HomeService

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

home_routes = Bottle()
home_controller = HomeController(home_routes)