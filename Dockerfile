FROM verdel/alpine-base:latest
MAINTAINER Vadim Aleksandrov <valeksandrov@me.com>

COPY rootfs /

RUN apk --no-cache --update add \
    bash \
    py-pip \
    && apk --update add --virtual build-dependencies git \
    && pip install --upgrade pip \
    && pip install git+http://github.com/verdel/vmware-task-telegram-bot \
    && apk del build-dependencies \
    # Clean up
    && rm -rf \
    /tmp/* \
    /var/cache/apk/*
