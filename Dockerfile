FROM ruby:3.1.3 AS build

ARG ROOT=/src/app

RUN apt-get update && apt-get install -y build-essential nodejs yarn libpq-dev postgresql-client imagemagick

WORKDIR ${ROOT}
  COPY Gemfile Gemfile.lock ${ROOT}/
  RUN gem install bundler:2.3.26
  RUN bundle install

FROM ruby:3.1.3 

WORKDIR ${ROOT}
  COPY . ${ROOT}
  COPY --from=build ${ROOT}/ ${ROOT}/

ENV RAILS_ENV=production

EXPOSE 3000

CMD sh -c "rails server"