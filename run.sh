#!/bin/sh

set -e

CONFIG_PATH="/kibana/config/kibana.yml"


#if [ ! -z "${KIBANA_PLUGINS_INSTALL}" ]; then
#   OLDIFS=$IFS
#   IFS=','
#   for plugin in ${KIBANA_PLUGINS_INSTALL}; do
#      if ! /opt/kibana-${VERSION}-linux-x86_64/bin/kibana-plugin list | grep -qs ${plugin}; then
#         yes | /opt/kibana-${VERSION}-linux-x86_64/bin/kibana-plugin install --batch ${plugin}
#      fi
#   done
#   IFS=$OLDIFS
#fi

exec /kibana/bin/kibana

