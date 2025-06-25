from bottle import Bottle, run
from config import Config
from beaker.middleware import SessionMiddleware

class App:
    
    def __init__(self):
        self.bottle = Bottle()
        self.config = Config()
        self.app_seccion= SessionMiddleware(self.bottle, Config.SESSION_OPTS)

    def setup_routes(self):
        from controllers import init_controllers

        print('🚀 Inicializa rotas!')
        init_controllers(self.bottle)


    def run(self):
        self.setup_routes()
        
        run(
            self.app_seccion,
            host=self.config.HOST,
            port=self.config.PORT,
            debug=self.config.DEBUG,
            reloader=self.config.RELOADER
        )


def create_app():
    return App()
