FROM codewaysa/python3:3.7.7_20200622

LABEL image_name="codewaysa/python3-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

# Alpine Linux v3.10 has Python-3.7 but no PyLint
# DL3020: we don't care about pinning versions for build time dependencies
# DL3019: we use "apk update" because we need multiple "apk add"
# hadolint ignore=DL3018,DL3019
RUN apk update && \
    apk add --virtual .pylint-dependencies py3-mccabe=0.6.1-r3 py3-six=1.12.0-r1 py3-toml=0.10.0-r1 && \
    apk add git=2.22.4-r0 py3-isort=4.3.19-r0 py3-pytest=4.5.0-r2 py3-setuptools=40.8.0-r1 py3-tox=3.9.0-r0 && \
    apk add --virtual .build-dependencies gcc musl-dev python3-dev && \
    pip3 install wheel==0.34.2 pylint==2.5.3 && \
    apk del .build-dependencies && \
    rm -rf /root/.cache /var/cache/apk/*

