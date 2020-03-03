FROM ubuntu:bionic
LABEL MAINTAINER felix@codemonauts.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update &&\
    apt-get install -y --no-install-recommends \
    curl \
    python3-pip \
    python3-setuptools \
    locales \
    gnupg-agent \
    mysql-client \
    software-properties-common \
    zip \
    zstd &&\
    locale-gen en_US.UTF-8 &&\
    pip3 install wheel &&\
    pip3 install pipenv

# Install node
RUN curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - &&\
    echo "deb https://deb.nodesource.com/node_12.x bionic main" | tee /etc/apt/sources.list.d/nodesource.list &&\
    apt-get update &&\
    apt-get install -y nodejs &&\
    npm install --global gulp-cli

COPY includes /

VOLUME /local

CMD run.sh
