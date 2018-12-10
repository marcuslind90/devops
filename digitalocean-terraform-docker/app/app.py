import socket
from flask import Flask
app = Flask(__name__)


@app.route("/")
def index():
    host = socket.gethostbyname(socket.gethostname())
    return f"Hello World from {host}"
