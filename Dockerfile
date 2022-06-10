FROM codewaysa/python3:3.9.7_20220609

LABEL image-name="codewaysa/python3-dev"
LABEL maintainer="l.lesinigo@codeway.ch"

# when PyPy has a newer version we use that instead of the one provided by Alpine
RUN python3 -m ensurepip --upgrade && \
    pip3 install --no-cache-dir --upgrade pip==22.1.2 setuptools==62.3.3 wheel==0.37.1 && \
    apk add --no-cache git=2.34.2-r0 && \
    apk add --no-cache --virtual .pytest-dependencies py3-iniconfig=1.1.1-r1 && \
    pip install --no-cache-dir black==22.3.0 coverage==6.4.1 isort==5.10.1 pylint==2.8.2 pytest==7.1.2 \
        pytest-cov==3.0.0 tox==3.25.0 && \
    rm -rf /root/.cache /var/cache/apk/*
