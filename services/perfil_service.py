from bottle import request
import os
from models.user import UserModel, User
STATIC_DIR = os.path.join(os.path.dirname(__file__), '..', 'static','perfil')
class   PerfilService: 
    def add_perfil_pic(self, user_id):
        self.user_id = user_id
        image = request.files.get('imagem_usuario')   
        nome_arquivo, extensao = os.path.splitext(image.filename)
        if extensao.lower() not in ('.png', '.jpg', '.jpeg'):
            raise ValueError("Formato de imagem inválido. Apenas PNG ou JPG.")       

        nome_unico_imagem = f"{user_id}{extensao}"
        caminho_para_salvar_img = os.path.join(STATIC_DIR)
        os.makedirs(caminho_para_salvar_img, exist_ok=True)
        caminho_completo_imagem = os.path.join(caminho_para_salvar_img,nome_unico_imagem)
        image.save(caminho_completo_imagem)
       
        usermodel = UserModel()
        user = usermodel.get_by_id(user_id)
        user.image_path = nome_unico_imagem
        usermodel.update_user(user)
        print(f"Imagem salva em: {caminho_completo_imagem}")
        
    @staticmethod
    def image_exists(path):
        try:
            return os.path.exists('static/perfil/' + path)
        except Exception:
            return False
        
    def del_perfil_pic(self,user):
        try:
            os.remove(os.path.join('static/perfil', user.image_path))
        except Exception:
            print("Erro ao excluir a imagem.")

    


        


    
        

   
   
           