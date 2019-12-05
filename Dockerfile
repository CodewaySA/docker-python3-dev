FROM codewaysa/python3:3.7.5_20191204

LABEL image_name="codewaysa/python3-dev"
LABEL maintainer="l.lesinigo@codeway.ch"
LABEL org.python.version="3.7.5"

# currently Alpine Linux v3.10 has Python-3.7 but no PyLint
# and Alpine Linux edge has PyLint but packaged for Python-3.8
# NB: py3-mccabe and py3-six are runtime dependencies for PyLint
# DL3020: we don't care about pinning versions for build time dependencies
# DL3019: we use "apk update" because we need multiple "apk add"
# hadolint ignore=DL3018,DL3019
RUN apk update && \
    apk add py3-isort=4.3.19-r0 py3-mccabe=0.6.1-r3 py3-six=1.12.0-r1 && \
    apk add --virtual .build-dependencies gcc musl-dev python3-dev && \
    pip3 install wheel==0.33.6 pylint==2.4.4 && \
    apk del .build-dependencies && \
    rm -rf /root/.cache /var/cache/apk/*

