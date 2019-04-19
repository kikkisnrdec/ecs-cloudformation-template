FROM mysql:5.7
ENV MYSQL_ALLOW_EMPTY_PASSWORD=yes
ENV MYSQL_DATABASE=HOGEHOGE
ENV MYSQL_USER=PIYOPIYO
ENV MYSQL_PASSWORD=FOOFOO
COPY ./conf.d/mysql.cnf /etc/mysql/conf.d/mysql.cnf
COPY ./sql /docker-entrypoint-initdb.d
