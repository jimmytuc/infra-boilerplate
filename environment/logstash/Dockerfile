FROM docker.elastic.co/logstash/logstash:6.8.12
USER root
RUN mkdir -p /var/log/logstash
RUN chown -R logstash:logstash /var/log/logstash
USER logstash

ADD ./config/share.config/* /usr/share/logstash/config/
ADD ./config /app/config
RUN logstash-plugin remove x-pack
