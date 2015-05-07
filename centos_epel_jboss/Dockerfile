FROM dpuerta/centos_epel_base:7
MAINTAINER David Puerta Vera <puertavera@gmail.com>

ENV JBOSS_VERSION 4.2.2.GA

COPY jboss-$JBOSS_VERSION /usr/local/software/jboss-$JBOSS_VERSION

RUN ln -s /usr/local/software/jboss-$JBOSS_VERSION /usr/local/software/jboss

RUN mkdir /var/log/jboss \
&& chown -R 3000:33 /var/log/jboss \
&& ln -s /var/log/jboss /usr/local/software/jboss/server/default/log \
&& chown -R 3000:33 /usr/local/software/jboss-$JBOSS_VERSION

COPY jboss /usr/bin/

VOLUME [ "/var/log/jboss" ]

EXPOSE 8080



