import json
import os
import datetime

DATA_DIR = os.path.join(os.path.dirname(__file__), '..', 'data')

#class HomeModel:
    #def __init__(self):
        #self.data_file = os.path.join(DATA_DIR, 'home.json')
class Home:
    def __init__(self, texto, avaliacao,id=None, criado_em=None):
        
        self.id = id if id is not None else int(datetime.datetime.now().timestamp() * 1000)
        self.texto = texto  
        self.avaliacao = avaliacao 
        self.criado_em = criado_em if criado_em is not None else datetime.datetime.now().isoformat()
        
        

    def to_dict(self):
        
        return {
            'id': self.id,
            'texto': self.texto,
            'avaliacao': self.avaliacao,
            'criado_em': self.criado_em
        }

    @classmethod
    def from_dict(cls, data):
        
        return cls(
            id=data.get('id'),
            texto=data.get('texto'),
            avaliacao=data.get('avaliacao'),
            criado_em=data.get('criado_em')
        )


class HomeModel:
    DATA_PATH = os.path.join(DATA_DIR, 'home.json') #

    def __init__(self):
        self.home_items = self._load()

    def _load(self):
        os.makedirs(DATA_DIR, exist_ok=True)
        if not os.path.exists(self.DATA_PATH):
            return []
        with open(self.DATA_PATH, 'r', encoding='utf-8') as f:
            try:
                data = json.load(f)
                
                sorted_data = sorted(data, key=lambda x: x.get('id', 0), reverse=True)
               
                return [Home.from_dict(item) for item in sorted_data]
            except (json.JSONDecodeError, TypeError):
                return []

    def get_all(self):
        return self.home_items
        
    def _save(self):
       
        with open(self.DATA_PATH, 'w', encoding='utf-8') as f:
            json.dump([item.to_dict() for item in self.home_items], f, indent=4, ensure_ascii=False)

    def add_item(self, texto):
        
        if not texto or not texto.strip():
            return 
            
        novo_item = Home(texto=texto)
        
        self.home_items.insert(0, novo_item) 
         
        self._save()