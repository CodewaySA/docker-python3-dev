FROM codewaysa/python3:3.7.10_20220609

LABEL image-name="codewaysa/python3-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

# Alpine Linux v3.10 has Python-3.7 but no PyLint
# DL3018: we don't care about pinning versions for build time dependencies
# DL3019: we use "apk update" because we need multiple "apk add"
# hadolint ignore=DL3018,DL3019
RUN apk update && \
    apk add --virtual .pylint-dependencies py3-mccabe=0.6.1-r3 py3-six=1.12.0-r1 && \
    apk add --virtual .pytest-dependencies py3-packaging=19.0-r0 py3-parsing=2.4.0-r0 && \
    apk add git=2.22.5-r0 py3-isort=4.3.19-r0 py3-setuptools=40.8.0-r1 py3-tox=3.9.0-r0 && \
    apk add --virtual .build-dependencies gcc musl-dev python3-dev && \
    pip3 install --no-cache-dir black==21.6b0 coverage==5.5 pylint==2.9.3 pytest==6.2.4 pytest-cov==2.12.1 wheel==0.36.2 && \
    apk del .build-dependencies && \
    rm -rf /root/.cache /var/cache/apk/*
