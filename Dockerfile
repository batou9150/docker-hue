FROM ubuntu:18.04

# Installing Dependencies
RUN apt-get update -y && \
  apt-get install -y \
    openjdk-8-jdk \
    bc \
    curl \
    wget \
    dnsutils \
    git \
    ant \
    gcc \
    g++ \
    libffi-dev \
    libkrb5-dev \
    libmysqlclient-dev \
    libsasl2-dev \
    libsasl2-modules-gssapi-mit \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev \
    libxslt-dev \
    make \
    maven \
    libldap2-dev \
    python-dev \
    python-setuptools \
    libgmp3-dev \
    software-properties-common

# java 8
RUN update-java-alternatives -s java-1.8.0-openjdk-amd64

# Installing Node.js
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  apt-get install -y nodejs

# Installing Hue
ENV HUE_VERSION=4.5.0
ENV HUE_HOME=/opt/hue-$HUE_VERSION
ENV HUE_CONF_DIR=/etc/hue/conf
RUN mkdir $HUE_HOME && mkdir /etc/hue && ln -s $HUE_HOME/desktop/conf $HUE_CONF_DIR
WORKDIR $HUE_HOME

RUN git clone https://github.com/cloudera/hue.git -b release-$HUE_VERSION .
RUN make apps
RUN rm $HUE_CONF_DIR/*.ini
RUN useradd -ms /bin/bash hue && chown -R hue $HUE_HOME

EXPOSE 8888

# Installing confd
RUN  wget  https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 -O /bin/confd \
    && chmod a+x /bin/confd
ADD config/conf.d/* /etc/confd/conf.d/
ADD config/templates/* /etc/confd/templates/

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["./build/env/bin/supervisor"]
