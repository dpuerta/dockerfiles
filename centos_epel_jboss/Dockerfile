FROM dpuerta/centos_epel_base:7
MAINTAINER David Puerta Vera <puertavera@gmail.com>

ENV JBOSS_VERSION 4.2.2.GA

COPY jboss-$JBOSS_VERSION /usr/local/jboss-$JBOSS_VERSION

RUN ln -s /usr/local/jboss-$JBOSS_VERSION /usr/local/jboss

RUN mkdir /var/log/jboss \
&& ln -s /var/log/jboss /usr/local/jboss/server/default/log \

COPY jboss /usr/bin/

VOLUME [ "/var/log/jboss" ]

EXPOSE 8080

CMD ["/usr/bin/jboss"]


