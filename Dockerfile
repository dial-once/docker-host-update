FROM alpine:3.3
MAINTAINER jonathan@dialonce.io

RUN apk add --no-cache openssh sed
ADD run.sh /run.sh

CMD /run.sh
