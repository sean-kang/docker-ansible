FROM python:3.7-slim
MAINTAINER Sean Kang <es.guybrush@gmail.com>

RUN apt-get update
RUN apt-get install -y jq gcc git python-dev libffi-dev libssl-dev
RUN pip install --upgrade ansible ara awscli boto3 psycopg2 pyopenssl
RUN mkdir ~/.ssh/
RUN echo "StrictHostKeyChecking no" > ~/.ssh/config
