FROM ubuntu:bionic

ENV LC_ALL=C.UTF-8 LANG=C.UTF-8

RUN apt update && \
    apt upgrade -y && \
    apt install -y --no-install-recommends firefox python3-pip python3.8 python3.8-minimal wget xvfb && \
    wget -O geckodriver.tar.gz https://github.com/mozilla/geckodriver/releases/download/v0.29.1/geckodriver-v0.29.1-linux64.tar.gz && \
    tar -zxvf geckodriver.tar.gz -C /usr/bin/ && \
    rm geckodriver.tar.gz && \
    pip3 install pipenv

WORKDIR /app

COPY Pipfile Pipfile.lock /app/

RUN pipenv install --system --deploy

RUN rm Pipfile Pipfile.lock

COPY ./main.py /app/
