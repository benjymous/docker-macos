FROM ubuntu:18.04
MAINTAINER benjymous <benjymous@users.noreply.github.com>

RUN apt update
RUN apt install -y curl git make clang wget rsync cmake
RUN cd /opt \
 && git clone https://github.com/tpoechtrager/osxcross.git \
 && cd osxcross \
 && curl -L -o tarballs/MacOSX10.11.sdk.tar.xz https://github.com/benjymous/docker-macos/blob/master/sdk?raw=true \
 && UNATTENDED=1 ./build.sh

ENV PATH $PATH:/opt/osxcross/target/bin
