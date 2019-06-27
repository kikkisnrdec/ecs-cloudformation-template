FROM tomcat:9-jre8-alpine
RUN rm -rf /usr/local/tomcat/webapps/* /tmp/* \
    && mkdir -p /tmp/sh \
    && cat $CATALINA_HOME/conf/server.xml | sed "s/port=\"8080\"/port=\"9081\"/" > /tmp/server.xml \
    && mv /tmp/server.xml $CATALINA_HOME/conf/server.xml \
    && apk add --no-cache mysql-client redis
COPY ./sh/*.sh /tmp/sh/
# Remove a comment out in case that you want to use downloaded JCE.
#COPY ./security/*.jar /usr/lib/jvm/java-X.X-openjdk/jre/jre/lib/security/
COPY ./war/*.war /usr/local/tomcat/webapps/ROOT.war
RUN chmod -R 777 /tmp/*
ENTRYPOINT ["sh", "/tmp/sh/entrypoint.sh"]
