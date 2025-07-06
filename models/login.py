from models.user import UserModel
class Login:

    def __init__(self,email,password):
        self.email=email
        self.password=password

    def to_dict(self):
        return{
            'email': self.email,
            'password': self.password
        }
    @classmethod
    def from_dict(cls,data):
                return cls(
            email=data['email'],
            password=data['password']
        )
class LoginModel(UserModel):
    def __init__(self):
        self.users = self._load()

    def validate_login(self,email,password):
        for user in self.users:
            if user.email == email and user.password == password:
                return True
        return False

             
     