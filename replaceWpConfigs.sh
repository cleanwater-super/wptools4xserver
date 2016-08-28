#!/bin/sh
if [ $# -ne 4 ]; then
 echo "argument count is $#" 1>&2
 echo "type wordpress root oldpath newpath olddb newdb"
exit 1
fi

OLDPATH=$1
NEWPATH=$2
OLDDB=$3
NEWDB=$4

sed -i -e "s:/$OLDPATH/:/$NEWPATH/:g" .htaccess
rm .htaccess-e
sed -i -e "s|define('DB_NAME', '$OLDDB');|define('DB_NAME', '$NEWDB');|" wp-config.php
rm wp-config.php-e 
