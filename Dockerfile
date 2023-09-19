FROM ruby:3.1.3

ARG ROOT=/src/app

RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs vim postgresql-client imagemagick

RUN mkdir -p ${ROOT}

WORKDIR ${ROOT}
  COPY Gemfile Gemfile.lock ${ROOT}/
  RUN gem install bundler:2.3.26
  RUN bundle install

ENV RAILS_ENV=production

COPY . ${ROOT}

EXPOSE 3000

CMD sh -c "rails server"