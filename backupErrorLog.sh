#!/bin/sh
source ${HOME}/.wptoolsrc

ULLDIR="userlandLog"

if [ ! -e ${HOME}/${ULLDIR} ]; then 
	mkdir -p ${HOME}/${ULLDIR}
fi

cp ${HOME}/${DOMAIN}/log/${DOMAIN}.error_log ${HOME}/${ULLDIR}/${DOMAIN}.error_log.`date '+%F_%Hh%Mm%Ss'`
