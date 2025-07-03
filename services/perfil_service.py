from bottle import request
import os
import requests
STATIC_DIR = os.path.join(os.path.dirname(__file__), '..', 'static','perfil')
class   PerfilService: 
    def add_perfil_pic(self, user_id):
        self.user_id = user_id
        image = request.files.get('imagem_usuario')   
        nome_arquivo, extensao = os.path.splitext(image.filename)
        if extensao.lower() not in ('.png', '.jpg', '.jpeg'):
            raise ValueError("Formato de imagem inválido. Apenas PNG ou JPG.")       

        # alvar a imagem no disco
        # Define um nome de arquivo único para evitar conflitos
        nome_unico_imagem = f"{user_id}{extensao}"
        caminho_para_salvar_img = os.path.join(STATIC_DIR)
        #caminho_para_html = f"image/posts/{nome_unico_imagem}"
        os.makedirs(caminho_para_salvar_img, exist_ok=True)
        caminho_completo_imagem = os.path.join(caminho_para_salvar_img,nome_unico_imagem)
        image.save(caminho_completo_imagem)
        print(f"Imagem salva em: {caminho_completo_imagem}")
        
    @staticmethod
    def image_exists(path):
        try:
            return os.path.exists('static/perfil/' + path)
        except Exception:
            return False

        


    
        

   
   
           