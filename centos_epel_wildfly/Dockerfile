FROM dpuerta/centos_epel_base:7
MAINTAINER David Puerta Vera <puertavera@gmail.com>

ENV WILDFLY_VERSION 9.0.0.CR1

RUN cd /usr/local/ \
&& curl -o /usr/local/wildfly-$WILDFLY_VERSION.tar.gz -SL http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz \
&& tar xvzf wildfly-$WILDFLY_VERSION.tar.gz \
&& rm -f wildfly-$WILDFLY_VERSION.tar.gz


RUN ln -s  /usr/local/wildfly-$WILDFLY_VERSION /usr/local/wildfly

RUN mkdir /var/log/wildfly \
&& ln -s /var/log/wildfly /usr/local/wildfly/standalone/log 
COPY init.d/wildfly.conf /etc/default/wildfly.conf
COPY init.d/wildfly-init-redhat.sh /etc/init.d/wildfly

COPY standalone.xml /usr/local/wildfly/standalone/configuration/

VOLUME [ "/var/log/wildfly" ]

EXPOSE 8080

CMD [ "/usr/local/wildfly/bin/standalone.sh" ]


