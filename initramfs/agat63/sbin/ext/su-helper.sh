#!/sbin/busybox sh
# root installation helper by GM
rm /data/.agat/install-root > /dev/null 2>&1
(
while : ; do
	# keep this running until we have root
	if [ -e /data/.agat/install-root ] ; then
		rm /data/.agat/install-root
		/sbin/busybox sh /sbin/ext/install.sh
        	exit 0
	fi
	if [ -e /system/xbin/su ] ; then
                exit 0
        fi
        sleep 5
done
) &
