FROM alpine:3.11.3

ARG HUGO_VERSION=0.63.2
ARG HUGO_SHA=e288bd10d4c7c647d084e71b3f7518476f57e845
ARG HUGO_BUILD=hugo_${HUGO_VERSION}_Linux-64bit

WORKDIR /src
RUN apk add --no-cache --virtual deps curl tar \
    && mkdir "/tmp/${HUGO_BUILD}" \
    && curl -SL -o /tmp/${HUGO_BUILD}/hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BUILD}.tar.gz \
    && echo "${HUGO_SHA} */tmp/${HUGO_BUILD}/hugo.tar.gz" | sha1sum -c - \
    && tar fxz /tmp/${HUGO_BUILD}/hugo.tar.gz -C /usr/local/bin hugo \
    && rm -rf "/tmp/${HUGO_BUILD}" \
    && apk del deps

VOLUME ["/src", "/public"]
EXPOSE 1313

ENTRYPOINT ["hugo"]
CMD ["server", "--baseURL=http://localhost:1313", "--bind=0.0.0.0", "--buildDrafts", "--buildFuture"]
