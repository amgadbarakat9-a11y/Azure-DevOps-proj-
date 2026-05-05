from flask import Flask, request, jsonify
from pymongo import MongoClient

app = Flask(__name__)

client = MongoClient("mongodb://mongo:27017/")
db = client["mydb"]
collection = db["data"]

@app.route('/')
def home():
    return "App is running"

@app.route('/data', methods=['POST'])
def add_data():
    item = request.json
    collection.insert_one(item)
    return jsonify({"message": "Data added"}), 201

@app.route('/data', methods=['GET'])
def get_data():
    items = list(collection.find({}, {"_id": 0}))
    return jsonify(items)

app.run(host='0.0.0.0', port=3000)