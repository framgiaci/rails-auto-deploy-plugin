
FROM ruby:2.5.1
RUN apt-get -y update
RUN gem install capistrano \
    capistrano-rvm \
    capistrano-rails \
    capistrano-bundler \
    capistrano-sidekiq \
    capistrano-passenger \
    capistrano-laravel \
    capistrano-composer \
    capistrano-npm \
    capistrano3-unicorn \
    capistrano3-puma \
    whenever
COPY commands.sh /scripts/commands.sh
RUN ["chmod", "+x", "/scripts/commands.sh"]

ENTRYPOINT ["/scripts/commands.sh"]
WORKDIR /workdir
