#!/bin/bash 

FULL_PATH=`realpath $0`
DPATH=`dirname $FULL_PATH`

docker=( "wildfly" "jboss" "mysql" "ldap" )

### validateOpction [containerName]
function validateOption {
	local n=$#
	local value=${!n}
	for ((i=1;i < $#;i++)) {
		if [ "${!i}" == "${value}" ]; then
			echo "y"
			return 0
		fi
	}
	echo "n"
	return 1	
}

### runningContainer [containerName]

function runningContainer {
	echo `docker ps -f "name=$1" -q |wc -l `
}

### existContainer [containerName]

function existContainer {
	echo `docker ps -a -f "name=$1" -q |wc -l `
}

### build [containerName]

function build {
	build_$1
}

####### build para cada imagen

function build_wildfly {
	docker pull dpuerta/centos_epel_wildfly:8.2 >/dev/null
}

function build_jboss {
	docker pull dpuerta/centos_epel_jboss:4.2.2 >/dev/null
	
}

function build_mysql {
	docker pull dpuerta/centos_epel_mysql:5.1 >/dev/null
}

function build_ldap {
	docker pull dpuerta/centos_epel_slapd:2.4 >/dev/null
}

### run [containerName]

function run {
	stop $1
	delete $1
	run_$1	
}

###### run para cada contenedor

function run_wildfly {
	build_wildfly
	echo "Creamos el contenedor de wildfly"
	docker run -d -p 8080:8080 --name wildfly -v /var/log/wildfly:/var/log/wildfly dpuerta/centos_epel_wildfly:8.2
	 
}

function run_jboss {
	build_jboss
	echo "Creamos el contenedor de jboss"
	docker run -d --name jboss -v /var/log/jboss:/var/log/jboss -p 8080:8080 dpuerta/centos_epel_jboss:4.2.2 >/dev/null
}

function run_mysql {
	build_mysql
	echo "Creamos el contenedor de mysql"
	docker run -d -e MYSQL_ROOT_PASSWORD="12345" -e MYSQL_USER=prueba -e MYSQL_USER_TEST=test -e MYSQL_PASSWORD="12345" -e MYSQL_PASSWORD_TEST="12345" -e MYSQL_DATABASE="prueba" -e MYSQL_DATABASE_TEST="test"  -p 3306:3306 --name mysql dpuerta/centos_epel_mysql:5.1 >/dev/null
}

function run_ldap {
	build_ldap
	echo "Creamos el contenedor de ldap"
	docker run -d --name ldap -p 389:389 dpuerta/centos_epel_slapd:2.4 >/dev/null
}

#####


function delete {
	if [ $(existContainer $1) -eq 1 ]; then
		stop $1
		echo "Eliminamos el contenedor $1"
		docker rm $1 >/dev/null
	fi
}

######

function start {
	if [ $(runningContainer $1) -eq 0 ]; then
		if [ $(existContainer $1) -eq 0 ]; then
			run_$1
		fi
		echo "Arrancamos el contenedor: $1"
		docker start $1 >/dev/null
	fi
}

function stop {
	if [ $(runningContainer $1) -ge 1 ]; then
		echo "Paramos el contenedor: $1"
		docker stop $1 >/dev/null 
	fi
}

function restart {
	stop $1
	start $1
}


################################

function messages {
	echo "ERROR"
	echo "USE $0 [start|stop|restart|run|delete] CONTENEDOR"
	echo "LISTA DE CONTENEDORES: "${docker[@]}
	echo
}

if [ $(validateOption "${docker[@]}" $2) == "y" ]; then
	case $1 in
		start|stop|restart|run|delete)
			$1 $2
			;;
		*)
			messages
			exit 2
	esac

	exit 0
else
	messages
	exit 2
fi

