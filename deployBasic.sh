#!/bin/sh
if [ $# -ne 2 ]; then
  if [ $# -lt 1 ]; then
    echo "argument count is $#" 1>&2
    echo "type [wordpress_root_path] [branch_name]"
    exit 1
  fi
fi

source ${HOME}/.wptoolsrc
ENVPATH=$1

BRANCH=""
if [ $# -eq 1 ]; then
  BRANCH="master"
else
  BRANCH=$2
fi

cd ${HOME}/gitwork
rm -rf design
git clone ${CLONE_URL}
cd design
if [ ${BRANCH} != "master" ]; then
  git checkout -b ${BRANCH} origin/${BRANCH}
fi
echo \<\?php\ \${GITHASH}\=\"`git rev-parse --short HEAD`\"\;\${GITBRANCH}\=\"`git rev-parse --abbrev-ref HEAD`\"\; \?\> > githashbranch.php

tar zcvf ${DESIGN_NAME}.tar.gz ${DESIGN_NAME}/
mv ${DESIGN_NAME}.tar.gz ${PATHTOWP}/${ENVPATH}/wp-content/themes
cd ${PATHTOWP}/${ENVPATH}/wp-content/themes
tar zxvf  ${DESIGN_NAME}.tar.gz
rm  ${DESIGN_NAME}.tar.gz
cd ${HOME}/gitwork/design
mv githashbranch.php ${PATHTOWP}/${ENVPATH}/wp-content/themes/${DESIGN_NAME}
