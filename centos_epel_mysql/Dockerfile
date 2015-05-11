FROM fbiete/centos_epel:6

RUN yum clean all \
&& yum install mysql-server -y \
&& yum clean all

COPY docker-entrypoint.sh /

RUN rm -rf /var/lib/mysql/*

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld_safe"] 
