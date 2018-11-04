# How to update tags in files for DevOps

It is common to tag your Docker images with a commit or a version instead of 
just a common "latest" or "production" tag. This creates a problem for how you
then run the correct image automatically in a CI/CD workflow.

If you always build new commits, and your tag always changes, how do you then 
specify in your `docker-compose.yml` or `Dockerrun.aws.json` (AWS Elastic 
Beanstalk) which tag that should run?

The answer is that you programatically update the tag within your file that 
specify how to run your containers, and then you deploy this updated file to 
your server.


## Using Bash `sed` command

`sed` allows you to substitute text within a file using regular expressions.
Inside `update-dockerrun.sh` you can see how we pipe the output from a `cat` 
command, and use `sed` to substitute line 6 of the file (the line that 
contains image definition of container) with a new image name and a new tag.

Pros:
    - Does not impact the structure of the file. It keeps any comments, 
      formatting or order of fields.
    - Does not require any other language to be installed on your machine.
Cons:
    - Harder to maintain. If you change your file that defines your containers 
      your shell script might break, if you rely on things like line number to 
      determine which line to update.

## Write a Python script

Using a language such as Python you can read in the contents of your file and 
load it as a dictionary with the `json` or `yaml` module, and then very easily 
change values without relying on regular expressions or line numbers.

You can see an example in `update-compose.py`.

Pros:
    - Easier to maintain and write. You don't care about line numbers or 
      minor changes in your original file.
Cons:
    - Since you load in the content and later dump it back to a file, you will 
      change the formatting of the file and it will strip away any comments. 
      It will also change the order of your definitions -- which shouldn't 
      matter in most cases.