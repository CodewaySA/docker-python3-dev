# docker-python3-dev

This is a [Python3](https://www.python.org) image based on `codewaysa/python3` ([GitHub](https://www.github.com/CodewaySA/docker-python3), [Docker Hub](https://hub.docker.com/r/codewaysa/python3)) with development tools included.

Tools included in this image:
* [isort](https://github.com/timothycrosley/isort) to lint `import`s
* [PyLint](https://www.pylint.org) for syntax and style checks
* [tox](https://tox.readthedocs.org) for test automation
* [wheel](https://github.com/pypa/wheel) for packaging

This image is meant to be used as a base to manually test stuff during development or as part of a CI/CD pipeline.

Sources for this image are published on [GitHub](https://www.github.com/CodewaySA/docker-python3-dev) and builds are available from [Docker Hub](https://hub.docker.com/r/codewaysa/python3-dev).

# Gitlab CI integration

If your Python project uses [setuptools](https://pypi.org/project/setuptools/) you could use a `.gitlab-ci.yml` like this to test and build it:
```yaml
image: "codewaysa/python3-dev:3.7"

stages:
  - test
  - build

isort:
  stage: test
  script: "isort --check-only --diff --recursive"

pylint:
  stage: test
  script: "pylint -E $( ./setup.py --name )"

tox:
  stage: test
  script: "tox -e py37"

wheel:
  stage: build
  script: "python3 setup.py bdist_wheel"
  artifacts:
    paths:
    - dist/*.whl
```
