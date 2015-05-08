**Base:** CentOS

**Extra:**

	- EPEL
	- tar
	- gosu
	- logrotate
	- en_US.UTF-8 locale
	- openjdk
	- ImageMagic 
	- ExifTools
	- Rar
	- Zip 
	- wildfly	
**Notes:**

CentOS-Docker official image only includes *en_US* locales,
so if you need to generate a specific locale do this in your image:

	RUN /docker-genlocale.sh locale charmap output-name


Example:

	RUN /docker-genlocale.sh es_ES ISO-8859-15 es_ES@euro

The Tag use versión 8.2.2.FINAAL, If you need change it use:

	ENV WILDFLY_VERSION [VERSION]

Example: 
	
	ENV WILDFLY_VERSION 9.0.0.Beta2

If you want to change the locale override those ENV variables in your image:

	ENV LANG en_US.UTF-8
	ENV LANGUAGE en_US.UTF-8
	ENV LC_ALL en_US.UTF-8


or in your container at running time:

	docker run -d --name app_name -e "LANG=en_US.UTF-8" -e "LANGUAGE=en_US.UTF-8" -e "LC_ALL=en_US.UTF-8" -v /var/log/jboss:/var/log/jboss dpuerta/centos_epel_wildfly:8.2 
