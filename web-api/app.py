from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/')
def login():
    return jsonify({"message":"Hello Flask!"})

app.run()