FROM dpuerta/centos_yum_update:6

RUN gzip -d /usr/share/i18n/charmaps/ISO-8859-1.gz \
&& localedef -c -i es_ES -f ISO-8859-1 es_ES.iso88591

ENV LANG es_ES.iso88591
ENV LANGUAGE es_ES.iso88591
ENV LC_ALL es_ES.iso88591


