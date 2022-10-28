FROM xhofe/alist:latest
LABEL MAINTAINER="frozen12"


WORKDIR /opt/alist/

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
