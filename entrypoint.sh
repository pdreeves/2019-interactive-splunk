#!/bin/bash

set -e

if [ -n "$SPLUNK_PASSWORD" ]
then
  rm -rf /opt/splunk/etc/passwd
  echo -e '\n[user_info] \nUSERNAME=admin \nPASSWORD='$SPLUNK_PASSWORD >> /opt/splunk/etc/system/default/user-seed.conf
fi

case "$1" in
  splunk)
    /usr/sbin/runuser -l splunk -c '/opt/splunk/bin/splunk start'
    /bin/bash
    ;;
  bash)
  /bin/bash
esac
