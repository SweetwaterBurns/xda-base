#!/sbin/sh
mkdir -p /sd-ext
rm /cache/recovery/command
rm /cache/update.zip
touch /tmp/.ignorebootmessage
pkill adbd
pkill recovery
exit 1
