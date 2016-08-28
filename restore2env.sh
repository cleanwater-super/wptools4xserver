#!/bin/sh
if [ $# -ne 4 ]; then
 echo "argument count is $#" 1>&2
 echo "$0 [dump_file] [my-client.cnf_file] [mysql_hostname] [mysql_dbname]"
exit 1
fi

source ${HOME}/.wptoolsrc

DUMPFILE=$1
CNFFILENAME=$2

echo "restoring mysql dump to joyonews_debug db."
mysql --defaults-extra-file=${HOME}/${CNFFILENAME} -h ${MYSQLHOST} ${MYSQLDB} < ${DUMPFILE}

