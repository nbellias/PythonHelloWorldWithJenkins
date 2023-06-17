FROM python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN virtualenv venv
RUN venv/bin/pip install -r requirements.txt

COPY . .
