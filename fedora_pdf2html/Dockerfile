FROM fedora:21
MAINTAINER David Puerta Vera <puertavera@gmail.com>

#RUN localedef -c -i es_ES -f ISO-8859-1 es_ES.iso88591

#ENV LANG es_ES.iso88591
#ENV LANGUAGE es_ES.iso88591
#ENV LC_ALL es_ES.iso88591

RUN gpg2 --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
&&  curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64" \
&& curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64.asc" \
&& gpg2 --verify /usr/local/bin/gosu.asc \
&& rm /usr/local/bin/gosu.asc \
&& chmod +x /usr/local/bin/gosu

RUN yum clean all\
&& yum install cmake gcc gnu-getopt java-1.8.0-openjdk libpng-devel fontforge-devel cairo-devel poppler-devel libspiro-devel freetype-devel  poppler-data libjpeg-turbo-devel git  gcc-c++ cpp -y make ImageMagick \
&& yum clean all \
&& git clone git://github.com/coolwanglu/pdf2htmlEX.git \
&& cd pdf2htmlEX \
&& git checkout incoming \
&& cmake . \
&& make -j"$(nproc)" \
&& make install \
&& cd \
&& rm -rf /pdf2htmlEX \
&& yum remove cmake gcc git gcc-c++ cpp make -y 
