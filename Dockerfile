FROM resin/rpi-raspbian:jessie

ENV INFLUX_VERSION 1.1.0

RUN apt-get update && apt-get install -y wget tar

WORKDIR /tmp
RUN wget https://dl.influxdata.com/influxdb/releases/influxdb-${INFLUX_VERSION}_linux_armhf.tar.gz 
RUN tar xvfz influxdb-${INFLUX_VERSION}_linux_armhf.tar.gz

WORKDIR influxdb-${INFLUX_VERSION}-1
RUN cp -r usr/ / && \
cp -r var/ / && \
cp -r etc/ /

RUN useradd --system -d /var/lib/influxdb influxdb && \
chown -R influxdb /var/lib/influxdb

ADD src/influxdb.conf /config/influxdb.conf
ADD src/run.sh /run.sh

ENV PRE_CREATE_DB **None**
ENV SSL_SUPPORT **False**
ENV SSL_CERT **None**

RUN chmod +x /run.sh
# Server
EXPOSE 8083
#HTTP API
EXPOSE 8086

WORKDIR /var

VOLUME ["/data"]

CMD ["/run.sh"]

