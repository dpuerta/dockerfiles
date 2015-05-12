**Base:** CentOS

**Extra:**

	- EPEL
	- tar
	- gosu
	- logrotate
	- en_US.UTF-8 locale
	- openldap 2.4
	
**Notes:**

CentOS-Docker official image only includes *en_US* locales,
so if you need to generate a specific locale do this in your image:

	RUN /docker-genlocale.sh locale charmap output-name


Example:

	RUN /docker-genlocale.sh es_ES ISO-8859-15 es_ES@euro



If you want to change the locale override those ENV variables in your image:

	ENV LANG en_US.UTF-8
	ENV LANGUAGE en_US.UTF-8
	ENV LC_ALL en_US.UTF-8


or in your container at running time:

	docker run -d --name app_name -e "LANG=en_US.UTF-8" -e "LANGUAGE=en_US.UTF-8" -e "LC_ALL=en_US.UTF-8" dpuerta/centos_epel_slapd:2.4



mkdir -p ~/app/docker/openldap/lib

mkdir -p ~/app/docker/openldap/slapd.d

chcon -Rt svirt_sandbox_file_t ~/app/docker/openldap

docker run --name app_openldap --ulimit nofile=1024:1024 -v [confdir]:/etc/openldap/slapd.d -v [dbdir]:/var/lib/ldap -p 389:389 -d dpuerta/centos_epel_openldap:2.4


