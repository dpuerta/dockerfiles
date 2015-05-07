FROM dpuerta/centos_epel_base:7
MAINTAINER David Puerta Vera <puertavera@gmail.com>

ENV WILDFLY_VERSION 8.2.0.Final

COPY wildfly-$WILDFLY_VERSION /usr/local/software/wildfly-$WILDFLY_VERSION
http://download.jboss.org/wildfly/8.2.0.Final/wildfly-8.2.0.Final.tar.gz

RUN ln -s  /usr/local/software/wildfly-$WILDFLY_VERSION /usr/local/software/wildfly

RUN mkdir /var/log/wildfly \
&& chown -R 3000:33 /var/log/wildfly \
&& ln -s /var/log/wildfly /usr/local/software/wildfly/standalone/log \
&& chown -R 3000:33 /usr/local/software/wildfly-$WILDFLY_VERSION \
&& adduser -u 3000 -g 33 desa
COPY init.d/wildfly.conf /etc/default/wildfly.conf
COPY init.d/wildfly-init-redhat.sh /etc/init.d/wildfly

COPY standalone.xml /usr/local/software/wildfly/standalone/configuration/

VOLUME [ "/var/log/wildfly" ]


