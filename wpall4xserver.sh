#!/bin/sh
source ${HOME}/.wptoolsrc
${HOME}/gitwork/bin/backupwpfiles.sh
${HOME}/gitwork/bin/dumpmysql4xserver.sh
find ${HOME}/backup -type f -mtime +5 -exec rm -f {} \;;
