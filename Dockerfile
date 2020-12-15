FROM codewaysa/python3:3.7.7_20201214

LABEL image_name="codewaysa/python3-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

# Alpine Linux v3.10 has Python-3.7 but no PyLint
# DL3020: we don't care about pinning versions for build time dependencies
# DL3019: we use "apk update" because we need multiple "apk add"
# hadolint ignore=DL3018,DL3019
RUN apk update && \
    apk add --virtual .pylint-dependencies py3-mccabe=0.6.1-r3 py3-six=1.12.0-r1 && \
    apk add --virtual .pytest-dependencies py3-packaging=19.0-r0 py3-parsing=2.4.0-r0 py3-typing=3.6.6-r1 && \
    apk add git=2.22.4-r0 py3-isort=4.3.19-r0 py3-setuptools=40.8.0-r1 py3-tox=3.9.0-r0 && \
    apk add --virtual .build-dependencies gcc musl-dev python3-dev && \
    pip3 install --no-cache-dir black==20.8b1 coverage==5.3 pylint==2.6.0 pytest==6.2.0 pytest-cov==2.10.1 wheel==0.36.2 && \
    apk del .build-dependencies && \
    rm -rf /root/.cache /var/cache/apk/*
