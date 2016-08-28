#!/bin/sh
source ${HOME}/.wptoolsrc
echo "creating mysql dump file."
/usr/bin/mysql --defaults-extra-file=${HOME}/my-client.cnf -h ${MYSQLHOST} ${MYSQLDB} -N -e 'SELECT table_name FROM INFORMATION_SCHEMA.TABLES WHERE table_schema = "'${MYSQLDB}'" AND table_name LIKE  "wp_%" AND table_name NOT LIKE  "wp_1%" AND table_name NOT LIKE  "wp_2%" AND table_name NOT LIKE  "wpd%"' | /usr/bin/xargs /usr/bin/mysqldump --defaults-file=${HOME}/my.cnf -h ${MYSQLHOST} ${MYSQLDB} > ${HOME}/backup/mysqldump_${WPENVIRONMENT}_`date '+%F_%Hh%Mm%Ss'`.sql
