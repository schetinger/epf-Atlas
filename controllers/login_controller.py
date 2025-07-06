from bottle import Bottle, request
from .base_controller import BaseController
from services.login_service import LoginService



class LoginController(BaseController):
    def __init__(self, app):
        super().__init__(app)
        self.setup_routes()
        self.login_service = LoginService()
    
    def setup_routes(self):
        self.app.route('/login', method=['GET','POST'], callback=self.login)

    def login(self):
        s = request.environ.get('beaker.session')
        if request.method == 'GET':
            if s.get('id')!=None:
                return self.redirect('/home')
            else:
                return self.render('login')
        else:
            
            if self.login_service.validate_login()==True:
                s = request.environ.get('beaker.session')
                s['id'] = self.login_service.get_user().id
                s['email'] = self.login_service.get_user().email
                s['admin'] = self.login_service.get_user().admin
                self.redirect('/home')
            else:
                return self.render('login', error='Usuário ou senha inválidos')
login_routes = Bottle()
login_controller = LoginController(login_routes)

