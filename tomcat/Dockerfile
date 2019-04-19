FROM tomcat:9-jre8-alpine
RUN rm -rf /usr/local/tomcat/webapps/* /tmp/* \
    && mkdir -p /tmp/sh \
    && cat $CATALINA_HOME/conf/server.xml | sed "s/port=\"8080\"/port=\"9081\"/" > $CATALINA_HOME/conf/server.xml \
    && apk add --no-cache mysql-client redis
COPY ./sh/*.sh /tmp/sh/
COPY ./war/*.war /usr/local/tomcat/webapps/ROOT.war
RUN chmod -R 777 /tmp/*
ENTRYPOINT ["sh", "/tmp/sh/entrypoint.sh"]
