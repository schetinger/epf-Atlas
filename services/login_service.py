from bottle import request
from models.login import LoginModel, Login
class LoginService:
    def __init__(self):
        self.LoginModel = LoginModel()

    def validate_login(self):
        self.email = request.forms.get('email')
        self.password = request.forms.get('password')
        model = LoginModel()
        return model.validate_login(self.email,self.password)
