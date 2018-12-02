FROM chromamaster/alpine_arm32v7

MAINTAINER ChromaMaster <>
LABEL architecture="ARM32v7"

ENV SYNCTHING_VERSION v0.14.53
ENV SYNCTHING_ARCH arm

WORKDIR /app
ADD syncthing-linux-${SYNCTHING_ARCH}-${SYNCTHING_VERSION}-rc.1.tar.gz .
RUN mv syncthing-linux-${SYNCTHING_ARCH}-${SYNCTHING_VERSION}-rc.1/ syncthing

RUN apk add --no-cache ca-certificates su-exec

# User & group to run syncthing
ENV PUID=18188 PGID=18188

COPY ./entrypoint.sh /

RUN chmod +x /entrypoint.sh

VOLUME ["/var/syncthing"]
EXPOSE 8384 22000 21027/udp

ENTRYPOINT ["/entrypoint.sh"]