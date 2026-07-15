FROM ruby:3.2.9

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    postgresql-client \
    nodejs \
    npm

WORKDIR /myapp

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

RUN RAILS_ENV=production bundle exec rails assets:precompile

CMD ["bash", "-c", "RAILS_ENV=production bin/rails server -b 0.0.0.0"]