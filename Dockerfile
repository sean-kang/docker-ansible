FROM python:2.7
LABEL maintainer="Sean Kang <es.guybrush@gmail.com>"

COPY requirements.txt /tmp/
RUN apt-get update && apt-get install -y \
    python-dev \
    jq \
    curl \
    git \
    libpq5 \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --requirement /tmp/requirements.txt
RUN mkdir ~/.ssh/ \
    && echo "StrictHostKeyChecking no" > ~/.ssh/config
RUN ln -sf /usr/local/bin/python2 /usr/bin/python
