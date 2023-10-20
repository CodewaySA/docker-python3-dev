FROM docker.io/codewaysa/python3:3.11.6_20231020

LABEL image-name="codewaysa/python3-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

RUN python3 -m ensurepip --upgrade && \
    pip3 install --no-cache-dir --upgrade pip==23.3 setuptools==68.2.2 wheel==0.41.2 && \
    apk add --no-cache git=2.40.1-r0 && \
    pip install --no-cache-dir black==23.10.0 coverage==7.3.2 httpx==0.25.0 isort==5.12.0 mypy==1.6.1 \
        poetry==1.6.1 pylint==3.0.1 pytest==7.4.2 pytest-cov==4.1.0 sphinx==7.2.6 tox==4.11.3 \
        types-PyYAML==6.0.12.12 types-requests==2.31.0.10 && \
    rm -rf /root/.cache /var/cache/apk/*
