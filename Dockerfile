FROM abuild-builder-cross-aarch64:latest

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
  \
  # cleanup
  cd /root && \
  rm -rf /tmp/* && \
  rm -f /var/cache/apk/*
