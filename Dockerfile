# syntax=docker/dockerfile:1
FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
  build-essential \
  gnupg2 \
  curl \
  less \
  git \
  libvips \
  libpq-dev \
  postgresql-client \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV PATH=/usr/local/node/bin:$PATH
RUN curl -sL https://github.com/nodenv/node-build/archive/master.tar.gz | tar xz -C /tmp/ && \
  /tmp/node-build-master/bin/node-build "20.10.0" /usr/local/node && \
  rm -rf /tmp/node-build-master

RUN gem update --system && gem install bundler

WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
