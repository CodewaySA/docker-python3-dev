FROM codewaysa/python3:3.7.10_20220609

LABEL image-name="codewaysa/python3-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

# Alpine Linux v3.10 has Python-3.7 but no PyLint
# DL3018: we don't care about pinning versions for build time dependencies
# DL3019: we use "apk update" because we need multiple "apk add"
# hadolint ignore=DL3018,DL3019
RUN apk update && \
    pip3 install --upgrade pip==22.1.2 setuptools==62.3.3 wheel==0.37.1 && \
    apk add --virtual .pylint-dependencies py3-mccabe=0.6.1-r3 py3-six=1.12.0-r1 && \
    apk add --virtual .pytest-dependencies py3-packaging=19.0-r0 py3-parsing=2.4.0-r0 && \
    apk add git=2.22.5-r0 && \
    apk add --virtual .build-dependencies gcc musl-dev python3-dev && \
    pip3 install --no-cache-dir --upgrade black==22.3.0 coverage==6.4.1 isort==5.10.1 pyfakefs==4.5.6 pylint==2.14.1 \
        pytest==7.1.2 pytest-cov==3.0.0 tox==3.25.0 && \
    apk del .build-dependencies && \
    rm -rf /root/.cache /var/cache/apk/*
