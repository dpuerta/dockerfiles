FROM fbiete/centos_epel:6

RUN yum clean all \
&& yum install openldap-servers openldap-clients -y \
&& yum clean all

#COPY docker-entrypoint.sh /

#RUN rm -rf /var/lib/mysql/*

#ENTRYPOINT ["/docker-entrypoint.sh"]

VOLUME ["/etc/openldap/slapd.d", "/var/lib/ldap", "/mnt/slapcat"]

EXPOSE 389

CMD ["slapd", "-h", "ldap:/// ldapi:///", \
"-u", "ldap", "-g", "ldap", \
"-F", "/etc/openldap/slapd.d", "-d", "0"] 
