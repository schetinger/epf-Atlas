import json
import os
DATA_DIR = os.path.join(os.path.dirname(__file__), '..', 'data')
class Post:
    def __init__(self, id, user_id, comment, rate, destination, image):
        self.id = id
        self.user_id = user_id
        self.comment = comment
        self.rate = rate
        self.destination = destination
        self.image = image

    def to_dict(self):
        return {
            'id': self.id,
            'user_id': self.user_id,
            'comment': self.comment,
            'rate': self.rate,
            'destination': self.destination,
            'image': self.image
        }
    @classmethod
    def from_dict(cls, data):
        return cls(
            id=data['id'],
            user_id=data['user_id'],
            comment=data['comment'],
            rate=data['rate'],
            destination=data['destination'],
            image=data['image']
        )
class PostModel:
    
    def __init__(self,user_id:int):
        self.FILE_PATH = os.path.join(DATA_DIR,str(user_id), 'posts.json')
        os.makedirs(os.path.dirname(self.FILE_PATH), exist_ok=True)
        self.posts = self._load()
    
    def _load(self):
        if not os.path.exists(self.FILE_PATH):
            return []
        try:
             with open(self.FILE_PATH, 'r', encoding='utf-8') as f:
           
                data = json.load(f)
                return [Post.from_dict(item) for item in data]
        except json.JSONDecodeError:
                print(f"AVISO: O arquivo {self.FILE_PATH} está vazio ou corrompido. Começando com uma lista nova.")
                return []
        
    def add_item(self, item):
        post = Post(**item)
        self.posts.append(post)
        self._save()

    def _save(self):
        with open(self.FILE_PATH, 'w', encoding='utf-8') as f:
            json.dump([p.to_dict() for p in self.posts], f, indent=4, ensure_ascii=False)

    def get_all(self):
        return self.posts
    