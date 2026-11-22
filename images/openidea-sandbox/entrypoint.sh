#!/bin/sh
set -eu
keydir="$HOME/.ssh-host"
if [ ! -f "$keydir/ssh_host_ed25519_key" ]; then
  mkdir -p "$keydir" && chmod 700 "$keydir"
  ssh-keygen -q -t ed25519 -N '' -f "$keydir/ssh_host_ed25519_key"
fi
exec /usr/sbin/sshd -D -e -f /etc/openidea/sshd_config -h "$keydir/ssh_host_ed25519_key"
