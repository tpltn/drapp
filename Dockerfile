FROM ruby:2.6.5

ENV LC_ALL=C.UTF-8
ENV APP /app
RUN mkdir $APP
WORKDIR $APP

COPY Gemfile Gemfile.lock $APP/
RUN bundle install

ADD . $APP
