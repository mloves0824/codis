FROM daocloud.io/library/golang:1.8

RUN apt-get update
RUN apt-get install -y autoconf

ENV GOPATH /gopath
ENV CODIS  ${GOPATH}/src/github.com/mloves0824/codis
ENV PATH   ${GOPATH}/bin:${PATH}:${CODIS}/bin
COPY . ${CODIS}

RUN make -C ${CODIS} distclean
RUN make -C ${CODIS} build-all

WORKDIR /codis
