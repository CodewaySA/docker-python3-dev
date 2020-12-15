FROM codewaysa/python3:3.8.5_20201214

LABEL image_name="codewaysa/python3-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

# Alpine Linux v3.12 has Python-3.8 but no PyLint, so we add it from edge
# also we need py3-typed-ast from edge/community as dependency for pylint
RUN echo '@edge_testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    echo '@edge_community http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
    apk add --no-cache py3-typed-ast@edge_community=1.4.1-r0 && \
    apk add --no-cache git=2.26.2-r0 py3-isort=4.3.21.2-r1 py3-pip=20.1.1-r0 py3-pylint@edge_testing=2.6.0-r0 \
                       py3-pytest=5.4.2-r0 py3-setuptools=47.0.0-r0 py3-tox=3.15.1-r0 py3-wheel=0.34.2-r1 && \
    apk add --no-cache --virtual .black-dependencies py3-regex=2020.5.14-r0 py3-click=7.1.2-r0 py3-pathspec=0.8.0-r0 && \
    pip install --no-cache-dir black==20.8b1 && \
    rm -rf /root/.cache /var/cache/apk/*
