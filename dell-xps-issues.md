# Dell XPS issues

## Chrome & Electron Apps freeze

```
$ dmesg -T
[ven. juil. 12 08:49:47 2019] [drm:intel_pipe_update_end [i915]] *ERROR* Atomic update failure on pipe A (start=14710 end=14711) time 133 us, min 1073, max 1079, scanline start 1071, end 1080
[ven. juil. 12 08:51:50 2019] [drm:intel_pipe_update_end [i915]] *ERROR* Atomic update failure on pipe A (start=22086 end=22087) time 110 us, min 1073, max 1079, scanline start 1072, end 1073
[ven. juil. 12 08:59:13 2019] audit: type=1130 audit(1562914754.090:52): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-tmpfiles-clean comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
[ven. juil. 12 08:59:13 2019] audit: type=1131 audit(1562914754.090:53): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-tmpfiles-clean comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
```

Links:
- https://bbs.archlinux.org/viewtopic.php?id=233230
- https://wiki.archlinux.org/index.php/kernel_mode_setting
- https://wiki.archlinux.org/index.php/Intel_graphics#Enable_GuC_/_HuC_firmware_loading

```
# vim /etc/modprobe.d/i915.conf
options i915 enable_guc=2
```

```
# cat /sys/kernel/debug/dri/0/i915_huc_load_status
# cat /sys/kernel/debug/dri/0/i915_guc_load_status
```