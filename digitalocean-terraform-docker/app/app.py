import os
from flask import Flask
app = Flask(__name__)


@app.route("/")
def index():
    app_count = os.environ.get("APP_COUNT", "Undefined")
    return f"Hello World from #{app_count}"
