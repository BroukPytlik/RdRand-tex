#!/bin/bash -xv

# {{{ RHTS environment check
IN_RHTS=0
if [ "${RESULT_SERVER}xx" != "xx" ]; 
then
	IN_RHTS=1;
	[ -x /usr/bin/rhts-environment.sh ] && . /usr/bin/rhts-environment.sh
else
    USERID=`id -u`
    if [ ${USERID} -ne 0 ]; then
	printf "You need to run as root\n"
	exit 1
    fi
fi
# }}}

[ -d /root/.ssh  ] || mkdir -v --mode=0700 /root/.ssh

umask 0177
[ -r ssh-keys ] && cat >> /root/.ssh/authorized_keys < ssh-keys
restorecon -FvvR /root/.ssh

cat >> /root/.bash_profile << EOF
PATH=./:$PATH
export PATH
EOF

cat >> /root/.bashrc < bashrc.sh

cat >> /etc/inputrc << EOF
set show-all-if-ambiguous on
EOF

[ ${IN_RHTS} == 1 ] && report_result $TEST PASS


