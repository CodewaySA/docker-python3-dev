FROM docker.io/codewaysa/python3:3.7.10_20230227

LABEL image-name="codewaysa/python3-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

# DL3018: we don't care about pinning versions for build time dependencies
# DL3019: we use "apk update" because we need multiple "apk add"
# hadolint ignore=DL3018,DL3019
RUN apk update && \
    pip3 install --upgrade pip==23.2.1 setuptools==68.0.0 wheel==0.41.2 && \
    apk add git=2.22.5-r0 && \
    apk add --virtual .build-dependencies gcc musl-dev python3-dev && \
    pip3 install --no-cache-dir --upgrade black==23.3.0 coverage==7.2.7 isort==5.11.5 mypy==1.4.1 pyfakefs==5.2.4 \
        pylint==2.17.5 pytest==7.1.2 pytest-cov==4.1.0 sphinx==5.3.0 tox==4.8.0 \
        types-PyYAML==6.0.12.11 types-requests==2.31.0.2 && \
    apk del .build-dependencies && \
    rm -rf /root/.cache /var/cache/apk/*
