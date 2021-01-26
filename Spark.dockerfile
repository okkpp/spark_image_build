FROM ubuntu

RUN apt-get update
# python dependency
RUN apt-get install gcc make libbz2-dev libncurses5-dev libgdbm-dev liblzma-dev sqlite3 libsqlite3-dev openssl libssl-dev libreadline-dev zlib1g-dev libffi-dev uuid-dev -y
# ssh and jre install
RUN apt-get install openssh-server openjdk-8-jre openjdk-8-jdk -y
# download python installer
RUN wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz
RUN tar -zxvf Python-3.7.4.tgz

WORKDIR /python
# install python
RUN ./configure --prefix=/usr/local/python
RUN make
RUN make install
RUN ln -s /usr/local/bin/python3 /usr/local/bin/python

WORKDIR /workspace

COPY ./spark ./spark
COPY ./bootstrap.sh /etc/bootstrap.sh

# time zone
ENV TZ Asia/Shanghai

ENTRYPOINT ["/etc/bootstrap.sh"]
CMD ["-d"]
