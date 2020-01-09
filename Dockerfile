FROM marekhanzal/alpine

RUN apk add --no-cache \
        openjdk8 nss
RUN groupadd -r app && useradd -rg app app
RUN java -version

WORKDIR /opt/app

USER app

CMD ["bin/app"]
