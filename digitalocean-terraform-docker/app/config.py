import os
import uuid


def get_id():
    if os.path.exists("/tmp/id.txt"):
        return open("/tmp/id.txt", mode="r").read()
    else:
        id = str(uuid.uuid4())
        with open("/tmp/id.txt", mode="w") as file:
            file.write(id)

        return id


APP_ID = get_id()
