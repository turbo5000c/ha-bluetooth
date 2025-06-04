#!/bin/bash
set -e

rm -f /var/run/dbus/pid
mkdir -p /var/run/dbus

echo "[INFO] Starting dbus..."
dbus-daemon --system --fork

echo "[INFO] Starting bluetoothd..."
bluetoothd &

echo "[INFO] Starting socat..."
socat TCP-LISTEN:55884,reuseaddr,fork UNIX-CONNECT:/var/run/dbus/system_bus_socket
