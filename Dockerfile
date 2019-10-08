FROM linuxserver/nginx:latest
LABEL maintainer="DynomiteCentral"

# set version label
ARG BUILD_DATE
ARG VERSION

LABEL build_version="Digitalhigh version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# add local files, set custom NGINX directory
COPY root /

# ports and volumes
VOLUME /config