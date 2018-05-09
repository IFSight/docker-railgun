#!/bin/bash
# https://ops.tips/gists/haproxy-docker-container-logs/

set -o errexit
set -o nounset

readonly RSYSLOG_PID="/var/run/rsyslogd.pid"

main() {
  start_rsyslogd
  start_railgun "$@"
}

# make sure we have rsyslogd's pid file not
# created before
start_rsyslogd() {
  rm -f $RSYSLOG_PID
  rsyslogd -n
}

# Starts the load-balancer (haproxy) with
# whatever arguments we pass to it ("$@")
start_railgun() {
  exec /usr/bin/rg-listener "$@"
}

main "$@"
