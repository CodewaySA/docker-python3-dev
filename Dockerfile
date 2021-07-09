FROM codewaysa/python3:3.9.5_20210709

LABEL image-name="codewaysa/python3-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

RUN apk add --no-cache git=2.32.0-r0 py3-isort=4.3.21.2-r3 py3-pip=20.3.4-r1 \
                       py3-setuptools=52.0.0-r3 py3-tox=3.23.0-r1 py3-wheel=0.36.2-r2 \
                       black=21.6_beta0-r0 && \
    apk add --no-cache --virtual .pytest-dependencies py3-attrs=20.3.0-r1 py3-iniconfig=1.1.1-r1 && \
    apk add --no-cache --virtual .pylint-dependencies py3-lazy-object-proxy=1.6.0-r1 py3-mccabe=0.6.1-r6 \
                                                      py3-wrapt=1.12.1-r1 && \
    pip install --no-cache-dir coverage==5.5 pylint==2.8.2 pytest==6.2.4 pytest-cov==2.12.1 && \
    rm -rf /root/.cache /var/cache/apk/*

