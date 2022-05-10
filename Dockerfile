# vi: ft=dockerfile
FROM rockylinux:8.5

RUN sed -i 's/enabled=0/enabled=1/' /etc/yum.repos.d/Rocky-PowerTools.repo

RUN yum makecache --refresh

RUN yum -y install \
    bash \
    curl \
    cyrus-sasl-devel \
    cyrus-sasl-gssapi \
    diffutils \
    file \
    librdkafka \
    librdkafka-devel \
    libzstd-devel \
    make \
    openssl \
    openssl-devel \
    php-cli \
    php-devel \
    php-pear \
    vim-minimal \
    yum-utils \
    zlib-devel \
    && true

RUN pecl install rdkafka

RUN echo 'extension=rdkafka.so' > /etc/php.d/20-rdkafka.so.ini

ADD ca-cert /
ADD kafka-topics.php /
ADD openssl.cnf /

ENV OPENSSL_CONF=/openssl.cnf

SHELL ["/bin/bash", "-c"]
RUN echo "PATH=$PATH" > /etc/environment
