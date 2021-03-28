FROM node:alpine

ARG WORKDIR="/opt/smtp2http"

RUN apk update && \
    apk upgrade && \
    apk add --no-cache openssh && \
    mkdir -p ${WORKDIR}

COPY . ${WORKDIR}

RUN cd ${WORKDIR} && npm install -g

WORKDIR ${WORKDIR}

ENTRYPOINT ["smtp2http"]
