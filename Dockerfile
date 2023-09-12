FROM docker.io/codewaysa/python3:3.10.13_20230912

LABEL image-name="codewaysa/python3-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

RUN python3 -m ensurepip --upgrade && \
    pip3 install --no-cache-dir --upgrade pip==23.0.1 setuptools==67.4.0 wheel==0.38.4 && \
    apk add --no-cache git=2.38.4-r0 && \
    pip install --no-cache-dir black==23.1.0 coverage==7.2.1 isort==5.12.0 mypy==1.0.1 pylint==2.16.2 pytest==7.2.1 \
        pytest-cov==4.0.0 sphinx==6.1.3 tox==4.4.6 types-PyYAML==6.0.12.8 types-requests==2.28.11.15 && \
    rm -rf /root/.cache /var/cache/apk/*
