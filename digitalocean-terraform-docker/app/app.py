from flask import Flask, jsonify
app = Flask(__name__)
app.config.from_object("config")


@app.route("/")
def index():
    app_id = app.config.get("APP_ID")
    return jsonify(app_id=app_id)
