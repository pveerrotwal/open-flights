FROM ruby:2.7.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /open-flights
RUN gem install bundler -v 2.1.4 
WORKDIR /open-flights
ENV BUNDLER_VERSION 2.1.4
ADD Gemfile /open-flights/Gemfile 
ADD Gemfile.lock /open-flights/Gemfile.lock
RUN bundle install
ADD . /open-flights