###
# Vydia Dockerfile for dev
# TODO: dry up docker files: https://trello.com/c/VTqpLVPS
# Important: when modifying Dockerfiles, be sure to modify all of them.  We have multiple docker files with repetition, so keep them all in sync.
###
FROM ubuntu:trusty

###
# OS Packages Round 1
###
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
  # needed for `add-apt-repository` to function properly
  apt-transport-https \
  # provides `add-apt-repository` command
  software-properties-common \
  # used before round 2
  wget

###
# OS Packages Round 2
###
# Add PostgreSQL repo
RUN add-apt-repository -y "deb https://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main"
# Authentication for postgres packages
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
ENV PATH="/usr/lib/postgresql/10/bin/:${PATH}"
# refresh list with new repos
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
  build-essential \
  curl \
  fonts-liberation \
  imagemagick \
  libmagickcore-dev \
  libmagickwand-dev \
  libnspr4 \
  libnss3 \
  libpq-dev \
  libxml2 \
  libxml2-dev \
  libxslt1-dev \
  locales \
  openssl \
  python-software-properties \
  xdg-utils \
  zlib1g-dev \
  # psql
  libpq-dev \
  postgresql-client-10 \
  # lsof is not used by our code and is here for troubleshooting after sshing in
  lsof \
  ssh

###
# Locales
###
RUN locale-gen en_US en_US.UTF-8 cy_GB.UTF-8
ENV LC_ALL=C.UTF-8
ENV LANG=US.UTF-8
ENV LANGUAGE=en_US.UTF-8

###
# Ruby
###
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
  libssl-dev \
  libreadline-dev \
  git-core \
  libffi-dev \
  libgdbm-dev \
  libncurses5-dev \
  libreadline-dev \
  libssl-dev \
  libtool \
  libyaml-dev \
  zlib1g-dev
RUN git clone https://github.com/rbenv/ruby-build.git /usr/local/src/ruby-build \
    && /usr/local/src/ruby-build/install.sh \
    # Install ruby and bundler gem
    && ruby-build 2.5.3 /usr/local \
    && gem update --system \
    && gem install bundler --force \
    # uninstall the default rake or else our rake will conflict and you'll always have to use bundle exec
    && gem uninstall rake --force

###
# Ruby Gems
###
COPY Gemfile* /tmp/gemfiles/
WORKDIR /tmp/gemfiles
# RUN gem install sequel_pg -v 1.12.0 -- --with-cflags="-DSPG_MAX_FIELDS=512"
RUN bundle install

WORKDIR /web
