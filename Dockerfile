FROM codewaysa/python3:3.8.10_20210709

LABEL image-name="codewaysa/python3-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

# Alpine Linux v3.12 has Python-3.8 but no PyLint, so we add it from edge
# also we need py3-typed-ast from edge/community as dependency for pylint
RUN apk add --no-cache git=2.30.2-r0 py3-isort=4.3.21.2-r1 py3-pip=20.3.4-r0 \
                       py3-setuptools=51.3.3-r0 py3-tox=3.21.4-r0 py3-wheel=0.36.2-r0 && \
    apk add --no-cache --virtual .black-dependencies py3-mypy-extensions=0.4.3-r0 \
                       py3-regex=2020.11.13-r0 py3-click=7.1.2-r0 py3-pathspec=0.8.1-r0 && \
    apk add --no-cache --virtual .pytest-dependencies py3-attrs=20.3.0-r0 py3-iniconfig=1.1.1-r0 && \
    apk add --no-cache --virtual .pylint-dependencies py3-mccabe=0.6.1-r5 py3-wrapt=1.12.1-r0 && \
    pip install --no-cache-dir black==21.6b0 coverage==5.5 pylint==2.9.3 pytest==6.2.4 pytest-cov==2.12.1 && \
    rm -rf /root/.cache /var/cache/apk/*
