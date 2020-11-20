FROM python:3.8 as builder
RUN apt-get update && apt-get install -y python-dev
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt

FROM python:3.8-slim
LABEL maintainer="Sean Kang <es.guybrush@gmail.com>"
COPY --from=builder /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN apt-get update && apt-get install -y \
    jq \
    curl \
    git \
    libpq5 \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir ~/.ssh/ \
    && echo "StrictHostKeyChecking no" > ~/.ssh/config
RUN ln -sf /usr/local/bin/python3 /usr/bin/python
