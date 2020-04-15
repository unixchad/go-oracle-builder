FROM golang:1.14-buster
RUN mkdir -p /opt/oracle
WORKDIR /opt/oracle
RUN apt update && apt upgrade -y && apt install unzip libaio-dev -y
RUN wget "https://download.oracle.com/otn_software/linux/instantclient/19600/instantclient-basic-linux.x64-19.6.0.0.0dbru.zip" && wget "https://download.oracle.com/otn_software/linux/instantclient/19600/instantclient-sdk-linux.x64-19.6.0.0.0dbru.zip" && unzip /opt/oracle/instantclient-basic-linux.x64-19.6.0.0.0dbru.zip && unzip /opt/oracle/instantclient-sdk-linux.x64-19.6.0.0.0dbru.zip && rm instantclient*.zip

ENV PKG_CONFIG_PATH=/opt/oracle/instantclient_19_6
RUN echo /opt/oracle/instantclient_19_6 > /etc/ld.so.conf.d/oracle-instantclient.conf && ldconfig

COPY oci8.pc ./instantclient_19_6/
