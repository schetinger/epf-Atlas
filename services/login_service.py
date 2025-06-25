from bottle import request
from models.login import LoginModel, Login
from models.user import UserModel
class LoginService:
    def __init__(self):
        self.LoginModel = LoginModel()

    def validate_login(self):
        self.email = request.forms.get('email')
        self.password = request.forms.get('password')
        model = LoginModel()
        return model.validate_login(self.email,self.password)
    
    def get_user(self):
        model = UserModel()
        self.email = request.forms.get('email')
        return model.get_by_email(self.email)
