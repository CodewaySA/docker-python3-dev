FROM docker.io/codewaysa/python3:3.8.15_20230912

LABEL image-name="codewaysa/python3-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

# DL3018: we don't care about pinning versions for build time dependencies
# DL3019: we use "apk update" because we need multiple "apk add"
# hadolint ignore=DL3018,DL3019
RUN apk update && \
    python3 -m ensurepip --upgrade && \
    pip3 install --no-cache-dir --upgrade pip==23.2.1 setuptools==68.2.1 wheel==0.41.2 && \
    apk add git=2.30.6-r0 && \
    apk add --virtual .build-dependencies gcc libffi-dev musl-dev python3-dev && \
    pip install --no-cache-dir black==23.9.1 coverage==7.3.1 isort==5.12.0 mypy==1.5.1 poetry==1.6.1 pylint==2.17.5 \
        pytest==7.4.2 pytest-cov==4.1.0 sphinx==7.1.2 tox==4.11.3 types-PyYAML==6.0.12.11 types-requests==2.31.0.2 && \
    apk del .build-dependencies && \
    rm -rf /root/.cache /var/cache/apk/*
