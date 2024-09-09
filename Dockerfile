FROM ubuntu:22.04 as base

WORKDIR /app
COPY . ./
RUN apt-get update
RUN apt-get install -y python3
RUN apt-get install -y pip
RUN apt-get install -y sqlite3
RUN pip install flask flask_httpauth
RUN ls
RUN echo "admin,adimn" > users.csv
RUN sqlite3 quiz.db < quiz.sql
RUN python3 adduser.py
RUN python3 softdes.py
