FROM alpine:3.3
MAINTAINER jonathan@dialonce.io

RUN apk add --no-cache openssh coreutils
ADD run.sh /run.sh

ENV HOST_USR root

CMD /run.sh
