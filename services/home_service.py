from bottle import request
from models.post import  Post
import uuid
from models.post import PostModel
import os
STATIC_DIR = os.path.join(os.path.dirname(__file__), '..', 'static','uploads')


class HomeService:
    def __init__(self,user_id:int):
        self.user_id = user_id
        self.post_model = PostModel(user_id=self.user_id)
        

    def get_all(self):
        
        return self.home_model.get_all()

    def create_item(self, texto):
        self.home_model.add_item(texto)
    def add_post(self):
        post = Post(user_id=None,
                    commment = request.forms.get('comment'),
                    rate = request.forms.get('rate'),
                    destination=request.forms.get('destination'))
        return post
    
    def add_post(self, user_id):
        self.user_id = user_id
        image = request.files.get('image')          
        nomeunico, extensao = os.path.splitext(image.filename)
        if extensao.lower() not in ('.png', '.jpg', '.jpeg'):
            raise ValueError("Formato de imagem inválido. Apenas PNG ou JPG.")

        nome_unico_imagem = f"{uuid.uuid4()}{extensao}"
        caminho_para_salvar_img = os.path.join(STATIC_DIR)
        os.makedirs(caminho_para_salvar_img, exist_ok=True)
        caminho_completo_imagem = os.path.join(caminho_para_salvar_img, nome_unico_imagem)
        image.save(caminho_completo_imagem)
        print(f"Imagem salva em: {caminho_completo_imagem}")

        data = request.forms
        post_data = {
           
            "id": str(uuid.uuid4()), 
            "user_id": self.user_id,
            "comment": data.get('comment'),
            "rate": data.get('rate'),
            "destination": data.get('destination'),
            "image": nome_unico_imagem 
        }


        novo_post = self.post_model.add_item(post_data)
        print("Dados do post salvos no JSON.")
        
        return novo_post 
   

    
        

   
   
           