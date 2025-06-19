from bottle import Bottle
from controllers.user_controller import user_routes
from controllers.home_controller import home_routes
from controllers.login_controller import login_routes
def init_controllers(app: Bottle):
    app.merge(user_routes)
    app.merge(home_routes)
    app.merge(login_routes)

