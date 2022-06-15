FROM alpine:3.12.4

# Replace alpine apk source
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

# Add glibc package
COPY ./glibc-2.31-r0.apk /lib/

# Add glibc key
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub

# Install glibc
RUN apk add /lib/glibc-2.31-r0.apk

ARG UNAME=alist
ARG UID=1003
ARG GID=1003

RUN addgroup -g $GID $UNAME
RUN adduser $UNAME -D -G $UNAME -u $UID -s /bin/sh

USER $UNAME

# Set workdir
WORKDIR /alist/alist

# Add start shell
COPY launch.sh /tmp/

# Add cloudreve binary file and default config file
COPY conf.yml /alist/files/

# Entrypoint
CMD sh /tmp/launch.sh
