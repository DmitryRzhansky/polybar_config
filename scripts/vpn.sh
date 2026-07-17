#!/usr/bin/env bash

if ip addr show tun0 >/dev/null 2>&1 && ip addr show tun0 | grep -q "inet "; then
  echo "on"
else
  echo "off"
fi
