#/bin/bash

start() {
	docker run -d -i -t -p 8080:8080 --name wildfly -v /var/log/wildfly:/var/log/wildfly dpuerta/centos_epel_iso_wildfly:8.2 /etc/init.d/wildfly start
}

