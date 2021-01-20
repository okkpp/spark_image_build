FROM ubuntu

WORKDIR /workspace

COPY ./spark ./spark
COPY ./bootstrap.sh /etc/bootstrap.sh

# time zone
ENV TZ Asia/Shanghai

RUN apt-get update
RUN apt-get install openssh-server openjdk-8-jre openjdk-8-jdk -y

ENTRYPOINT ["/etc/bootstrap.sh"]
CMD ["-d"]