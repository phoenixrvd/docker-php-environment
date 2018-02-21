#!/usr/bin/env bash

mysqldump -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE > /opt/sql/mysql-$MYSQL_DATABASE-$(date "+%Y%m%d-%H%M%S").sql