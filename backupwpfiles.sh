#!/bin/sh
source ${HOME}/.wptoolsrc
echo "creating tar.gz file."
cd ${PATHTOWP}/${WPENVIRONMENT}
tar cvfz ${HOME}/backup/${WPENVIRONMENT}_`date '+%F_%Hh%Mm%Ss'`.tar.gz ./
