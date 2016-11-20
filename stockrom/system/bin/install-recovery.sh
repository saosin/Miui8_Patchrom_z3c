#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 11665408 bbc06be535307def55478d3dd1594f1b2d3788ca 13414400 b4490fc5c0a261ad8f863c0c1173bb932cf45cb2
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/FOTAKernel:11665408:bbc06be535307def55478d3dd1594f1b2d3788ca; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:13414400:b4490fc5c0a261ad8f863c0c1173bb932cf45cb2 EMMC:/dev/block/platform/msm_sdcc.1/by-name/FOTAKernel bbc06be535307def55478d3dd1594f1b2d3788ca 11665408 b4490fc5c0a261ad8f863c0c1173bb932cf45cb2:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
