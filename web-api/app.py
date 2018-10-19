from flask import Flask, jsonify, request, make_response
import mysql.connector

app = Flask(__name__)
app.config['SECRET_SALT'] = 'anita'

@app.route('/')
def home():
    return jsonify({"message":"Hello Flask!"})

@app.route('/login')
def login():
    
    config = {
        'user': 'root',
        'password': 'ush@11n07p@55!',
        'host': 'localhost',
        'database': 'API_PYTHON',
        'raise_on_warnings': True
    }

    mysql_connection = mysql.connector.connect(**config)
    
    authentication_data = request.authorization
    if not authentication_data or not authentication_data.username or not authentication_data.password:
        return make_response('Could not verify', 401, {'WWW-Authenticate' : 'Basic realm="Authentication data required!"'})

    query = ("SELECT u.Username ,u.FirstName ,u.LastName ,u.Active ,u.Password FROM User u "
            "WHERE u.UserName = '%s'")

    print(authentication_data.username)
    
    cursor_user = mysql_connection.cursor()
    cursor_user.execute(query, (authentication_data.username))
    
    for (Username, FirstName, LastName, Active, Password) in cursor_user:
        print("Username: {0} First Name: {1} Last Name: {2} Password: {3} Active: {4} ".format(Username, FirstName, LastName, Active, Password))

    cursor_user.close()
    mysql_connection.close()

    return jsonify({"message":"Authenticating user..."})

app.run()