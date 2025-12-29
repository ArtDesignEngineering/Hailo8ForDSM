# Hailo8ForDSM
Compiled Hailo8 TPU 4.21.0 driver for Syno DSM 7.2.2 to use with Frigate NVR.

1. Disable "Secure Boot" in BIOS
2. Copy and install hailort_4.21.0_amd64.deb (optional, but recommended, gives you hailortcli tool)
_sudo sudo dpkg -i --force-bad-verify hailort_4.21.0_amd64.deb_
3. Copy hailo8_fw.4.21.0.bin to your /lib/firmware/hailo/hailo8_fw.bin     
_sudo cp hailo8_fw.4.21.0.bin /lib/firmware/hailo/hailo8_fw.bin_
4. Put hailo_pci_4.21.0.ko somewhere in your docker volume and run install script (below)
(to remove module use _sudo rmmod hailo_pci_)
5. Check with _hailortcli scan_ and _dmesg | grep hailo_
6. Prepare _hailo_start.sh_ startup script in DSM web interface: make it executable by root on boot with command line: _bash /volume1/homes/dadmin/hailo8/hailo_start.sh_
7. Reboot and check
