FROM codewaysa/python3:3.10.4_20220609

LABEL image-name="codewaysa/python3-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

RUN python3 -m ensurepip --upgrade && \
    pip3 install --no-cache-dir --upgrade pip==22.1.2 setuptools==62.3.3 wheel==0.37.1 && \
    apk add --no-cache git=2.36.1-r0 black=22.3.0-r0 py3-isort=5.10.1-r0 && \
    apk add --no-cache --virtual .pylint-dependencies py3-lazy-object-proxy=1.7.1-r0 && \
    apk add --no-cache --virtual .pytest-dependencies py3-iniconfig=1.1.1-r2 py3-packaging=21.3-r0 \
        py3-pluggy==1.0.0-r0 && \
    apk add --no-cache --virtual .tox-dependencies py3-distlib=0.3.4-r1 py3-toml=0.10.2-r3 \
        py3-virtualenv=20.14.1-r0 && \
    pip install --no-cache-dir coverage==6.4.1 mypy==0.961 pylint==2.14.1 pytest==7.1.2 pytest-cov==3.0.0 \
        sphinx==5.0.1 types-PyYAML==6.0.8 types-requests==2.27.30 tox==3.25.0 && \
    rm -rf /root/.cache /var/cache/apk/*
