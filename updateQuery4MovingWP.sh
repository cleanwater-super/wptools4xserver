#!/bin/sh
if [ $# -ne 3 ]; then
 echo "argument count is $#" 1>&2
 echo "specify DB [prefix] [old path] [new path]."
exit 1
fi

source ${HOME}/.wptoolsrc

PREFIX=$1
OLDPATH=$2
NEWPATH=$3

echo "UPDATE ${PREFIX}options SET option_value = replace(option_value, '${FIXEDURL}/${OLDPATH}', '${FIXEDURL}/${NEWPATH}') WHERE option_name = 'home' OR option_name = 'siteurl';"
echo "UPDATE ${PREFIX}posts SET guid = replace(guid, '${FIXEDURL}/${OLDPATH}/','${FIXEDURL}/${NEWPATH}/');"
echo "UPDATE ${PREFIX}posts SET post_content = replace(post_content , '${FIXEDURL}/${OLDPATH}/','${FIXEDURL}/${NEWPATH}/');"
echo "UPDATE ${PREFIX}postmeta SET meta_value = replace(meta_value , '${FIXEDURL}/${OLDPATH}/','${FIXEDURL}/${NEWPATH}/');"
echo "UPDATE ${PREFIX}options SET option_value = replace(option_value, '${FIXEDURL}/${OLDPATH}/', '${FIXEDURL}/${NEWPATH}/') WHERE option_name = 'recently_edited' OR option_name = 'ms_custom_login_options' OR option_name = 'infinite_scroll' OR option_name = '_transient_ga_admin_dashboard_6.4.930' ;"
echo "UPDATE ${PREFIX}options SET option_value = '' WHERE option_name = 'active_plugins';"
