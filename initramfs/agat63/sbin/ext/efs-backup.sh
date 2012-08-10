#!/sbin/busybox sh
if [ ! -f /data/.siyah/efsbackup.tar.gz ];
then
  mkdir /data/.agat
  chmod 777 /data/.agat
  /sbin/busybox tar zcvf /data/.agat/efsbackup.tar.gz /efs
  /sbin/busybox cat /dev/block/mmcblk0p1 > /data/.siyah/efsdev-mmcblk0p1.img
  /sbin/busybox gzip /data/.agat/efsdev-mmcblk0p1.img
  #make sure that sdcard is mounted, media scanned..etc
  (
    sleep 500
    /sbin/busybox cp /data/.agat/efs* /sdcard
  ) &
fi

