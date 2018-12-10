from flask import Flask
app = Flask(__name__)
app.config.from_object("config")


@app.route("/")
def index():
    app_id = app.config.get("APP_ID")
    return f"Hello World from {app_id}"
