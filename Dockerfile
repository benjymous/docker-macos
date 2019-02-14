#FROM debian:stretch
FROM ubuntu:18.04
MAINTAINER benjymous <benjymous@users.noreply.github.com>

RUN apt update
RUN apt install -y curl git make clang wget
RUN cd /opt \
 && git clone https://github.com/tpoechtrager/osxcross.git \
 && cd osxcross \
 && curl -L -o tarballs/MacOSX10.11.sdk.tar.xz https://github.com/phracker/MacOSX-SDKs/releases/download/MacOSX10.11.sdk/MacOSX10.11.sdk.tar.xz \
# && PORTABLE=1 UNATTENDED=1 ./build.sh
 && UNATTENDED=1 ./build.sh

ENV PATH $PATH:/opt/osxcross/target/bin
