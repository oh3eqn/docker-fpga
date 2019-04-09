#!/bin/bash
set -euo pipefail

NET_DEVICE=`ip route show default | awk '{print $5}'`
MAC_ADDRESS=`cat /sys/class/net/"${NET_DEVICE}"/address`

docker run -it --rm -e DISPLAY="${DISPLAY}" \
  --mac-address="${MAC_ADDRESS}" \
  --privileged --ipc host \
  -v "${HOME}":"${HOME}" \
  -v /tmp/.X11-unix/:/tmp/.X11-unix \
  -u root \
  diamond:install \
  /bin/bash
