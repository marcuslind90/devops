import os
from flask import Flask
app = Flask(__name__)


@app.route("/")
def index():
    host = os.environ.get("HOST", "App")
    return f"Hello World from {host}"
