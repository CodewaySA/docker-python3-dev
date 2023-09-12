FROM docker.io/codewaysa/python3:3.10.13_20230912

LABEL image-name="codewaysa/python3-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

RUN python3 -m ensurepip --upgrade && \
    pip3 install --no-cache-dir --upgrade pip==23.2.1 setuptools==68.2.1 wheel==0.41.2 && \
    apk add --no-cache git=2.38.5-r0 && \
    pip install --no-cache-dir black==23.9.1 coverage==7.3.1 isort==5.12.0 mypy==1.5.1 pylint==2.17.5 pytest==7.4.2 \
        pytest-cov==4.1.0 sphinx==7.2.5 tox==4.11.3 types-PyYAML==6.0.12.11 types-requests==2.31.0.2 && \
    rm -rf /root/.cache /var/cache/apk/*
