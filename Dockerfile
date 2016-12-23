FROM ruby:2.2

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
COPY *.gemspec /usr/src/app/

ARG BUNDLE_GEMS__CONTRIBSYS__COM

RUN bundle install

COPY . /usr/src/app

ENTRYPOINT [ "bundle", "exec", "je", "bin/sidekiq", "5", "scheduler" ]
ENV RACK_ENV production
