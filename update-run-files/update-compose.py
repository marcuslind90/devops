import os
import yaml


if __name__ == "__main__":

    path = os.path.dirname(__file__)

    # Read in compose file
    input_path = "{}{}".format(path, "docker-compose.yml")
    contents = yaml.load(open(input_path).read())

    # Update value, could load values from ENV vars.
    contents["services"]["app"]["image"] = "new_image:new_version"

    # Save file
    output_path = "{}{}".format(path, "outputs/docker-compose.yml")
    with open(output_path, mode="wb") as file:
        file.write(yaml.dump(contents, default_flow_style=False))
