FROM debian:jessie-slim

ENV VERSION 5.3.0

EXPOSE 5601

RUN apt-get update && apt-get -y install curl && \
    curl -s https://artifacts.elastic.co/downloads/kibana/kibana-$VERSION-linux-x86_64.tar.gz | tar zx -C / && \
    mv /kibana-${VERSION}-linux-x86_64 /kibana && \
    #apk add nodejs && \
    #rm -rf /kibana/node && \
    #mkdir -p /kibana/node/bin && \
    #ln -sf /kibana/node/bin/node /usr/bin/node && \
    #apk del curl && \
    #rm -rf /var/cache/apk/*
    apt-get clean

# Copy configuration
COPY config  /kibana/config
ADD run.sh /


ENV KIBANA_SERVER_PORT 5601
ENV KIBANA_SERVER_HOST "localhost"
ENV KIBANA_SERVER_BASH_PATH ""
ENV SERVER_MAX_PAYLOAD_BYTES 1048576
ENV SERVER_NAME "Kibana"
ENV ELASTICSEARCH_URL "http://localhost:9200"
ENV ELASTICSEARCH_ PRESERVE_HOST true
ENV KIBANA_INDEX ".kibana"
ENV KIBANA_DEFAULT_APPID "discover"

ENV ELASTICSEARCH_USERNAME "user"
ENV ELASTICSEARCH_PASSWRED "pass

ENV SERVER_SSL_ENABLE false
ENV SERVER_SSL_CERTIFICATE /path/to/your/server.crt
ENV SERVER_SSL_KEY /path/to/your/server.crt
ENV KIBANA_SSL_CERTIFICATE /path/to/your/client.crt
ENV KIBANA_SSL_KEY /path/to/your/client.key

ENV ELASTICSEARCH_SSL_CERTIFICATE_AUTHORITIES [ "/path/to/your/CA.pem" ]
ENV ELASTICSEARCH_SSL_TIMEOUT full
ENV ELASTICSEARCH_PING_TIMEOUT 1500
ENV ELASTICSEARCH_REQUEST_TIMEOUT: 30000
ENV ELASTICSEARCH_REQUEST_HEADER_WHITE_LIST [ authorization ]
ENV ELASTICSEARCH_CUSTOM_HEADERS {}
ENV ELASTICSEARCH_SHARD_TIMEOUT 0
ENV ELASTICSEARCH_STARTUP_TIMEOUT 5000

ENV KIBANA_PID_FILE stdout
ENV KIBANA_INTERVAL 5000

ENV KIBANA_LOGGING_DEST stdout
ENV KIBANA_LOGGING_SILENT false
ENV KIBANA_LOGGING_QUIT false
ENV KIBANA_LOGGING_VERBOSE false


ENV KIBANA_PLUGINS_INSTALL x-pack
ENV X_PACK_SECURITY_ENABLED false
ENV X_PACK_MONITORING_ENABLED true
ENV X_PACK_GRAPH_ENABLED true
ENV X_PACK_WATCHER_ENABLED true
ENV X_PACK_REPORTING_ENABLED true


ENTRYPOINT /run.sh
#ENTRYPOINT /bin/sh
#CMD ["/run.sh"]