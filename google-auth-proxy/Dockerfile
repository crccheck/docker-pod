FROM mini/base
MAINTAINER Chris <c@crccheck.com>

ENV GAP_VERSION 1.1.1
ENV GO_VERSION 1.4.2

ADD https://github.com/bitly/google_auth_proxy/releases/download/v${GAP_VERSION}/google_auth_proxy-${GAP_VERSION}.linux-amd64.go${GO_VERSION}.tar.gz /
RUN tar -zxf google_auth_proxy-${GAP_VERSION}.linux-amd64.go${GO_VERSION}.tar.gz && \
  mv google_auth_proxy-${GAP_VERSION}.linux-amd64.go${GO_VERSION}/google_auth_proxy . && \
  rmdir google_auth_proxy-${GAP_VERSION}.linux-amd64.go${GO_VERSION} && \
  rm google_auth_proxy-${GAP_VERSION}.linux-amd64.go${GO_VERSION}.tar.gz

CMD ["./google_auth_proxy", "-help"]
