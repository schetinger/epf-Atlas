from bottle import static_file
from bottle import request
class BaseController:
    def __init__(self, app):
        self.app = app
        self._setup_base_routes()


    def _setup_base_routes(self):
        """Configura rotas básicas comuns a todos os controllers"""
        self.app.route('/', method='GET', callback=self.home_redirect)
        self.app.route('/helper', method=['GET'], callback=self.helper)

        # Rota para arquivos estáticos (CSS, JS, imagens)
        self.app.route('/static/<filename:path>', callback=self.serve_static)
    

    
    def home_redirect(self):
        """Redireciona a rota raiz para /home caso esteja logado"""
        s = request.environ.get('beaker.session')

        if s.get('id')!=None:
            return self.redirect('/home')
        else:
         return self.redirect('/login')
    
    def helper(self):
        return self.render('helper-final')


    def serve_static(self, filename):
        """Serve arquivos estáticos da pasta static/"""
        s = request.environ.get('beaker.session')
        if s.get('id')!=None:
            return self.redirect('/login')
        else:
            return static_file(filename, root='./static')


    def render(self, template, **context):
        """Método auxiliar para renderizar templates"""
        from bottle import template as render_template
        return render_template(template, **context)


    def redirect(self, path):
        """Método auxiliar para redirecionamento"""
        from bottle import redirect as bottle_redirect
        return bottle_redirect(path)
