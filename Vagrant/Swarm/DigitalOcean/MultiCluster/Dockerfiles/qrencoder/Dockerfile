FROM ubuntu
LABEL cliente="GMV"
LABEL curso="Docker & Kubernetes"
RUN apt-get -y update&&apt-get -y install qrencode&&apt-get autoremove&&apt-get clean&&rm -rf /var/lib/apt/lists/*
WORKDIR /var/local/qrloop
#VOLUME ["/var/local/qrloop"]
COPY qrencoder.loop /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/qrencoder.loop"]
