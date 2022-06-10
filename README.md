# docker-python3-dev

This is a [Python3](https://www.python.org) image based on `codewaysa/python3` ([GitHub](https://www.github.com/CodewaySA/docker-python3), [Docker Hub](https://hub.docker.com/r/codewaysa/python3)) with development tools included.

Tools included in this image:
* [black](https://black.readthedocs.io/), the uncompromising code formatter
* [coverage](https://pypi.org/project/coverage/) to measure test coverage
* [git](https://git-scm.com) to enable installing code from Git repositories
* [isort](https://github.com/timothycrosley/isort) to lint `import`s
* [pip](https://pip.pypa.io) to install packages
* [PyLint](https://www.pylint.org) for syntax and style checks
* [pytest](https://docs.pytest.org) for code testing with [pytest-cov](https://github.com/pytest-dev/pytest-cov) extension
* [Setuptools](https://pypi.org/project/setuptools/) to manage and build python packages
* [Sphinx](https://www.sphinx-doc.org/) for documentation auto generation
* [tox](https://tox.readthedocs.org) for test automation
* [wheel](https://github.com/pypa/wheel) for packaging

This image is meant to be used as a base to manually test stuff during development or as part of a CI/CD pipeline.

Sources for this image are published on [GitHub](https://www.github.com/CodewaySA/docker-python3-dev) and builds are available from [Docker Hub](https://hub.docker.com/r/codewaysa/python3-dev).

# Gitlab CI integration

If your Python project uses [setuptools](https://pypi.org/project/setuptools/) you could use a `.gitlab-ci.yml` like this to test and build it:
```yaml
image: "codewaysa/python3-dev:3.8"

stages:
  - test
  - build

black:
  stage: lint
  script: "black --diff --check src $( ./setup.py --name )"

isort:
  stage: test
  script: "isort --check-only --diff --recursive"

pylint:
  stage: test
  script: "pylint -E $( ./setup.py --name )"

tox:
  stage: test
  script: "tox -e py38"

wheel:
  stage: build
  script: "python3 setup.py bdist_wheel"
  artifacts:
    paths:
    - dist/*.whl
```
