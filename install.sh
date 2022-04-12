#!/bin/bash

SELF=$(readlink -f $0)
SELF_DIR=$(dirname ${SELF})
BASE_REPO=/etc/yum.repos.d/CentOS-Base.repo

cd ${SELF_DIR}

if test -f ${SELF_DIR}/rpms/repodata/repomd.xml ;then
test -f ${BASE_REPO} && mv ${BASE_REPO} ${BASE_REPO}.bak__
cat <<__EOF > ${BASE_REPO}

[rpm-offline-repo]
name=rpm-offline-repo
baseurl=file://${SELF_DIR}/rpms
enabled=1
gpgcheck=0

__EOF
yum clean all && yum makecache
yum install -y @PACKAGE_NAMES@

test -f ${BASE_REPO}.bak__ && mv ${BASE_REPO}.bak__ ${BASE_REPO}

else
echo "Bad offline package"
exit -1
fi

