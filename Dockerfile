FROM lsioarmhf/nginx-armhf:latest
MAINTAINER Digitalhigh

# set version label
ARG BUILD_DATE
ARG VERSION
ARG HTTPPORT=5666
ARG HTTPSPORT=5667
ARG FASTCGIPORT=9000
ARG PORTS='$HTTPPORT:$HTTPSPORT:$FASTCGIPORT'

LABEL build_version="Digitalhigh version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# add local files, set custom NGINX directory
COPY root /

RUN echo "**** updating os ****" && \
      apk update 
RUN echo "**** installing aditional packages ****" && \
      apk --no-cache add gettext iptables 
RUN echo "**** Setting up firewall ****" && \
      envsubst "$PORTS" < /etc/templates/default > /defaults/default 
RUN chmod 777 /defaults/default && \
      echo "build complete"

# ports and volumes
VOLUME /config
