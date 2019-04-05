FROM python:2.7 as builder
RUN apt-get update && apt-get install -y python-dev
COPY requirements.txt /tmp/
RUN pip install --install-option="--prefix=/install" --requirement /tmp/requirements.txt

FROM python:2.7-slim
LABEL maintainer="Sean Kang <es.guybrush@gmail.com>"
COPY --from=builder /install /usr/local
RUN apt-get update && apt-get install -y \
    jq \
    curl \
    git \
    libpq5 \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir ~/.ssh/ \
    && echo "StrictHostKeyChecking no" > ~/.ssh/config
RUN ln -sf /usr/local/bin/python2 /usr/bin/python
