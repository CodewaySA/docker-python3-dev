FROM codewaysa/python3:3.7.10_20230227

LABEL image-name="codewaysa/python3-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

# Alpine Linux v3.10 has Python-3.7 but no PyLint
# DL3018: we don't care about pinning versions for build time dependencies
# DL3019: we use "apk update" because we need multiple "apk add"
# hadolint ignore=DL3018,DL3019
RUN apk update && \
    pip3 install --upgrade pip==23.0.1 setuptools==67.4.0 wheel==0.38.4 && \
    apk add --virtual .pylint-dependencies py3-mccabe=0.6.1-r3 && \
    apk add --virtual .pytest-dependencies py3-parsing=2.4.0-r0 && \
    apk add git=2.22.5-r0 && \
    apk add --virtual .build-dependencies gcc musl-dev python3-dev && \
    pip3 install --no-cache-dir --upgrade black==23.1.0 coverage==7.2.1 isort==5.11.5 mypy==1.0.1 pyfakefs==5.1.0 \
        pylint==2.16.2 pytest==7.1.2 pytest-cov==4.0.0 sphinx==5.3.0 tox==4.4.6 \
        types-PyYAML==6.0.12.8 types-requests==2.28.11.15 && \
    apk del .build-dependencies && \
    rm -rf /root/.cache /var/cache/apk/*
