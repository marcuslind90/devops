import uuid
from flask import Flask
app = Flask(__name__)
app.config.setdefault("id", str(uuid.uuid4()))


@app.route("/")
def index():
    app_id = app.config.get("id")
    return f"Hello World from {app_id}"
