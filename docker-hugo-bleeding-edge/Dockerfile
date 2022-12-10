# Bleeding edge hugo setup

FROM ubuntu:latest
MAINTAINER Olof Sjödin <me@olofsjodin.se>

RUN apt-get update \
    && apt-get -y install git mercurial wget \
    && wget https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.6.linux-amd64.tar.gz \
    && export PATH=$PATH:/usr/local/go/bin \
    && export GOPATH="/go" \
    && go get -u -v github.com/spf13/hugo \
    && mv $GOPATH/bin/hugo /usr/local/bin/hugo

VOLUME /hugo

COPY ./run.sh /
ENTRYPOINT ["/run.sh"]

EXPOSE 1313
