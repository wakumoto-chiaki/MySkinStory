FROM ruby:3.2.9

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    postgresql-client \
    nodejs \
    npm

WORKDIR /myapp

