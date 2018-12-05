FROM ubuntu:trusty

RUN apt-get update && apt-get install -y bc wget dnsutils

# Installing Oracle JDK
RUN apt-get install -y software-properties-common && \
	add-apt-repository -y ppa:webupd8team/java && \
	apt-get update -y && \
	echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections && \
	apt-get install -y oracle-java8-installer

# Installing Dependencies
RUN apt-get update -y
RUN apt-get install --fix-missing -q -y \
  git \
  ant \
  gcc \
  g++ \
  libkrb5-dev \
  libmysqlclient-dev \
  libssl-dev \
  libsasl2-dev \
  libsasl2-modules-gssapi-mit \
  libsqlite3-dev \
  libtidy-0.99-0 \
  libxml2-dev \
  libxslt-dev \
  libffi-dev \
  make \
  maven \
  libldap2-dev \
  python-dev \
  python-setuptools \
  libgmp3-dev \
  libz-dev

# Installing Hue
ENV HUE_VERSION=4.3.0
ENV HUE_HOME=/opt/hue-$HUE_VERSION
ENV HUE_CONF_DIR=/etc/hue/conf
RUN mkdir $HUE_HOME && mkdir /etc/hue && ln -s $HUE_HOME/desktop/conf $HUE_CONF_DIR
WORKDIR $HUE_HOME

RUN git clone https://github.com/cloudera/hue.git -b release-$HUE_VERSION .
RUN easy_install pylint==0.28.0
RUN make apps
RUN rm $HUE_CONF_DIR/*.ini

EXPOSE 8888

# Installing confd
RUN  wget  https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 -O /bin/confd \
    && chmod a+x /bin/confd
ADD config/conf.d/* /etc/confd/conf.d/
ADD config/templates/* /etc/confd/templates/

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["build/env/bin/hue", "runserver_plus", "0.0.0.0:8888"]
