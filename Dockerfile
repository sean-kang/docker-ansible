FROM python:3.7-slim
MAINTAINER Sean Kang <es.guybrush@gmail.com>

RUN apt-get update && apt-get install -y \
    jq \
    curl \
    gcc \
    git \
    python-dev \
    libffi-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*
COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt
RUN mkdir ~/.ssh/ \
    && echo "StrictHostKeyChecking no" > ~/.ssh/config
