# Hailo8ForDSM
Compiled Hailo8 (m.2 M-key) TPU 4.21.0 driver for DSM 7.2.2 (SA6400 model) to use with Frigate NVR.

One of the most common scenario of Frigate usage is to deploy it via docker on DSM 7.2.2, since DSM is very popular in home installations (it's much easier to install and setup comparing to other NAS systems).
Using popular AlderLake Intel nXXX platform (usually mini-pc) allow to build very powerful and power-efficient Frigate NVR solution (sometimes it is combined with home NAS storage, file server, media server and other roles).
But Frigate requires a detector, and for nXXX platform Hailo8 m.2 M-key it the best and optimal choice. And speaking about DSM - there is no official support for it since it is proprietary OS.
This is a solution for Hailo8 m.2 M-key deployment in DSM 7.2.2 for SA6400 model. It was tested both on n100 and n305.

1. Disable "Secure Boot" in BIOS

2. Copy and install hailort_4.21.0_amd64.deb from official Hailo Community (optional, but recommended, gives you hailortcli tool)

_sudo sudo dpkg -i --force-bad-verify hailort_4.21.0_amd64.deb_

3. Copy hailo8_fw.4.21.0.bin from official Hailo Community to your /lib/firmware/hailo/hailo8_fw.bin     

_sudo cp hailo8_fw.4.21.0.bin /lib/firmware/hailo/hailo8_fw.bin_

4. Put hailo_pci_4.21.0.ko somewhere in your docker volume and run _hailo_start.sh_ script 
(to remove module use _sudo rmmod hailo_pci_)

5. Check with _hailortcli scan_ and _dmesg | grep hailo_

6. Prepare _hailo_start.sh_ startup script in DSM web interface: make it executable by root on boot with command line: _bash /volume1/path/to/your/hailo_start.sh_

7. Reboot and check
