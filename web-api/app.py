from flask import Flask, jsonify, request, make_response
from werkzeug.security import generate_password_hash, check_password_hash
from flask_sqlalchemy import SQLAlchemy
import jwt
import datetime
import mysql.connector

app = Flask(__name__)
app.config['SECRET_SALT'] = 'DDi8ZGBc9oiVHdfgorPzA8f2u6YcbuNiYQE064WXJb0idhR34u70iDj7yEJGc8kF'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root:ush@11n07p@55!@localhost:3306/API_PYTHON'

db = SQLAlchemy(app)
db.init_app(app)

class UserModel(db.Model):
    __tablename__ = 'User'

    id = db.Column('id', db.Integer, primary_key=True)
    user_name = db.Column('username', db.String(50), unique=True)
    first_name = db.Column('firstname', db.String(50))
    last_name = db.Column('lastname', db.String(50))
    password = db.Column('password', db.String(80))
    gender = db.Column('gender', db.String(50))
    active = db.Column('active', db.String(50))

@app.route('/')
def home():
    return jsonify({"message":"Hello Flask!"})

@app.route('/login')
def login():
    authentication_data = request.authorization
    if not authentication_data or not authentication_data.username or not authentication_data.password:
        return make_response('Could not verify', 401, {'WWW-Authenticate' : 'Basic realm="Authentication data required!"'})
    
    user = UserModel.query.filter_by(user_name=authentication_data.username).first()
    base_datetime = datetime.datetime.now()
    
    if not user:
        return make_response('Could not verify', 401, {'WWW-Authenticate' : 'Basic realm="Authentication data required!"'})

    if check_password_hash(user.password, authentication_data.password):
        token = jwt.encode({'user_id' : user.id,
                            'iat' : base_datetime,
                            'exp' : base_datetime + datetime.timedelta(minutes=30)}, app.config['SECRET_SALT'])

        return jsonify({'token' : token.decode('UTF-8')})
    
    return make_response('Could not verify', 401, {'WWW-Authenticate' : 'Basic realm="Authentication data required!"'})

app.run(debug=True)