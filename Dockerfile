FROM ruby:2.7.1-alpine

RUN addgroup -S appgroup && adduser -S -G appgroup appuser
RUN mkdir /app
WORKDIR /app
USER appuser
RUN bundle config set without development test

COPY --chown=appuser:appgroup Gemfile Gemfile.lock ./
RUN bundle install --jobs=4

COPY --chown=appuser:appgroup . .
