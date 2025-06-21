from bottle import request
from models.home import HomeModel, Home

class HomeService:
    def __init__(self):
        self.home_model = HomeModel()

    def get_all(self):
        
        return self.home_model.get_all()

    def create_item(self, texto):
        
        self.home_model.add_item(texto)