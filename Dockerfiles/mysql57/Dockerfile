FROM mariadb:10.2

COPY config.cnf /etc/mysql/mariadb.conf.d/

COPY dump.sh /usr/bin/dump
COPY restore.sh /usr/bin/restore
RUN chmod  +x /usr/bin/dump /usr/bin/restore