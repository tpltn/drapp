FROM ruby:2.6.5

ENV LC_ALL=C.UTF-8
RUN groupadd -r appgroup && useradd --no-log-init -r -g appgroup appuser
RUN mkdir /app
WORKDIR /app
USER appuser

COPY --chown=appuser:appgroup Gemfile Gemfile.lock ./
RUN bundle install --without development test

COPY --chown=appuser:appgroup . .
