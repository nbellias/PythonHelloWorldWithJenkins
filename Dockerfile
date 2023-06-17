FROM python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install virtualenv
RUN virtualenv venv
RUN source venv/bin/activate
RUN pip install -r requirements.txt

COPY . .
