FROM codewaysa/python3:3.8.1_20200109

LABEL image_name="codewaysa/python3-dev"
LABEL maintainer="l.lesinigo@codeway.ch"
LABEL org.python.version="3.8.1"

# currently Alpine Linux v3.11 has Python-3.8 but no PyLint, so we add it from edge
# NB py3-wrapt is a runtime dependency for PyLint
RUN echo '@edge_testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    echo '@edge_community http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
    apk add --no-cache py3-isort=4.3.21.2-r1 py3-wrapt@edge_community=1.11.2-r1 py3-pylint@edge_testing=2.4.4-r0 && \
    pip3 install wheel==0.33.6 && \
    rm -rf /root/.cache /var/cache/apk/*

