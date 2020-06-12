FROM codewaysa/python3:3.8.3_20200612

LABEL image_name="codewaysa/python3-dev"
LABEL maintainer="l.lesinigo@codeway.ch"
LABEL org.python.version="3.8.3"

# currently Alpine Linux v3.12 has Python-3.8 but no PyLint, so we add it from edge
RUN echo '@edge_testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk add --no-cache py3-isort=4.3.21.2-r1 py3-pylint@edge_testing=2.5.3-r0 py3-wheel=0.34.2-r1 && \
    rm -rf /root/.cache /var/cache/apk/*
