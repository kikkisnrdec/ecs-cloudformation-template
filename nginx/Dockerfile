FROM nginx:mainline-alpine
RUN rm -rf /tmp/* \
    && mkdir -p /tmp/sh \
    && apk add --no-cache curl
COPY ./sh/* /tmp/sh/
COPY ./conf.d/* /etc/nginx/conf.d/
COPY ./www /usr/share/nginx/www
ENTRYPOINT ["sh", "/tmp/sh/entrypoint.sh"]