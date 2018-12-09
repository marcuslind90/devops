flake8 src/
rc=$?; if [[ $rc != 0 ]]; then echo "'flake8' failed."; exit $rc; fi

black --check src/
rc=$?; if [[ $rc != 0 ]]; then echo "'black --check' failed."; exit $rc; fi

coverage run -m unittest src/tests.py
rc=$?; if [[ $rc != 0 ]]; then echo "'coverage run -m unittest' failed."; exit $rc; fi

coverage report --omit=*/tests.py --fail-under=70
rc=$?; if [[ $rc != 0 ]]; then echo "'coverage report' failed."; exit $rc; fi
