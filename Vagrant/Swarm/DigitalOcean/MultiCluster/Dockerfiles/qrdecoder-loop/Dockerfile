FROM ubuntu
RUN apt-get -y update&&apt-get -y install zbar-tools&&apt-get autoremove&&apt-get clean&&rm -rf /var/lib/apt/lists/*
WORKDIR /var/local/qrloop
#VOLUME ["/var/local/qrloop"]
COPY qrdecoder.loop /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/qrdecoder.loop"]
#docker build -t secobau/qrdecoder-loop .
#docker push secobau/qrdecoder-loop
