FROM debian:jessie

ENV GAP_VERSION 1.1
ENV GO_VERSION 1.4.2
ENV MD5_SUM afcfc10be3da9e1ae728eb448a0b53f8

RUN apt-get update -q
RUN apt-get install -qy wget

RUN wget --no-verbose https://github.com/bitly/google_auth_proxy/releases/download/v${GAP_VERSION}/google_auth_proxy-${GAP_VERSION}.linux-amd64.go${GO_VERSION}.tar.gz
RUN echo "${MD5_SUM}  google_auth_proxy-${GAP_VERSION}.linux-amd64.go${GO_VERSION}.tar.gz" > google_auth_proxy.md5
RUN md5sum --check google_auth_proxy.md5
RUN tar --strip-components=1 -zxf google_auth_proxy-${GAP_VERSION}.linux-amd64.go${GO_VERSION}.tar.gz

ENTRYPOINT ["./google_auth_proxy"]
CMD ["-help"]
