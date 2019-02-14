#FROM debian:stretch
FROM ubuntu:18.04
MAINTAINER benjymous <benjymous@users.noreply.github.com>

RUN apt update
RUN apt install -y curl git make clang wget
RUN cd /opt \
 && git clone https://github.com/tpoechtrager/osxcross.git \
 && cd osxcross \
 && curl -L -o tarballs/MacOSX10.9.sdk.tar.xz https://s3.amazonaws.com/andrew-osx-sdks/MacOSX10.9.sdk.tar.xz \
# && PORTABLE=1 UNATTENDED=1 ./build.sh
 && UNATTENDED=1 ./build.sh

ENV PATH $PATH:/opt/osxcross/target/bin
