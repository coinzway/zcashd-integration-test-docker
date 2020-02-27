FROM ubuntu:18.04

EXPOSE 18232

RUN apt-get update

RUN apt-get -y install wget

WORKDIR /usr/src

RUN wget https://z.cash/downloads/zcash-2.1.1-1-linux64-debian-jessie.tar.gz
RUN tar -xzvf zcash-2.1.1-1-linux64-debian-jessie.tar.gz
RUN chmod +x zcash-2.1.1-1/bin/zcashd zcash-2.1.1-1/bin/zcash-cli zcash-2.1.1-1/bin/zcash-fetch-params
RUN ln -s /usr/src/zcash-2.1.1-1/bin/zcashd /usr/bin/zcashd
RUN ln -s /usr/src/zcash-2.1.1-1/bin/zcash-cli /usr/bin/zcash-cli
RUN ln -s /usr/src/zcash-2.1.1-1/bin/zcash-fetch-params /usr/bin/zcash-fetch-params

RUN zcash-fetch-params

ADD init-node.sh /tmp
RUN chmod 777 /tmp/init-node.sh
RUN mkdir -p /usr/src/node && touch /usr/src/node/zcash.conf

CMD /tmp/init-node.sh
