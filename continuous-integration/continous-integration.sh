flake8 src/
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi

coverage run -m unittest src/tests.py
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi

coverage report
