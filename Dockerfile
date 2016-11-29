FROM ruby:2.3.1
MAINTAINER Michal Szymanski <michal.t.szymanskih@gmail.com>

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN gem install bundler
RUN bundle install

EXPOSE 3000
CMD bundle exec thin  -R ./config.ru start
