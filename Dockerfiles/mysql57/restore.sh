#!/usr/bin/env bash

mysql -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /opt/sql_restore/$1