# Continous Integration with Python

Continuous Integration is a set of tasks that is being executed automatically 
whenever any changes to the code happens on the remote repository. These tasks 
can both be things that validate the quality of the code base, but also builds,
tags and release any kind of bundle or image.

Here we collect examples of different types of tasks that could be executed
during the CI stage in a CI/CD pipeline.

Run it all with `bash continous-integration.sh`.

## Linting

To ensure high quality of the code base, we can use static code analysis to 
verify that the code follow certain rules, standards and that no obvious bugs 
are being deployed or released.

Tools used:
- flake8
- flake8-mypy
- flake8-docstrings

### flake8
Make sure that code follow PEP8 code standards. 


### flake8-mypy
Adds type checking functionality to flake8, which validates that variables 
passed into methods that have types defined in their signatures, are of the 
correct type.

*Does not check for type errors within the code. Only in method/function 
signatures.*

Catches the following:

```python
    def foo(value: int):
        return value
    
    foo(value="bar")  # Raises TypeError
```

Misses the following:

```python
    def foo(value: int):
        bar: str
        return value + bar  # Raises TypeError
    foo(value=1)
```

### flake8-docstrings

Add style checking and linting of docstrings. It both validates that docstrings 
exists within modules, methods, classes and packages, but also validates that 
the styling of these docstrings are correct.

*In our example, we disable some checks within our .flake8 configuration file, 
we do not expect docstrings to be used in every single file. Only custom 
methods require docstrings in our repository.*


## Testing and Coverage

We use the built in `unittest` package to write tests. By using the 
`coverage.py` package we can execute our tests and report the code coverage.

We can choose to generate code coverage as XML or HTML. But in our case we only 
write it out to the console using `coverage report`.