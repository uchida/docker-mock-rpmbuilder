FROM fedora:latest
MAINTAINER Akihiro Uchida <uchida@turbare.net>

RUN dnf install -y rpmdevtools mock
RUN dnf clean all
RUN useradd builder
RUN usermod -a -G mock builder

VOLUME ["/rpmbuild"]
ADD build.sh /build.sh

USER builder
CMD ["/build.sh"]
