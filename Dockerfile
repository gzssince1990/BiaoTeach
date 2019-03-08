FROM ruby:2.5.3

RUN mkdir /app
WORKDIR /app
ADD . /app
RUN gem install bundler && gem update bundler
RUN bundle install
# RUN foreman start
