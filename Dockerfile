FROM arm64v8/alpine:3.7

COPY [ \
  "./qemu-aarch64-static", \
  "/usr/bin/qemu-aarch64-static" \
]

RUN \
  # apk
  apk update && \
  \
  # grub dependencies
  apk add autoconf && \
  apk add automake && \
  apk add bison && \
  apk add flex && \
  apk add gcc && \
  apk add gettext && \
  apk add libtool && \
  apk add linux-headers && \
  apk add make && \
  apk add python2 && \
  apk add git && \
  apk add musl-dev && \
  \
  # cleanup
  cd /root && \
  rm -rf /tmp/* && \
  rm -f /var/cache/apk/*
