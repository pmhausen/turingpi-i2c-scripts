Two small scripts to make control of compute nodes on a TuringPi easier
=======================================================================

Installation on control node
----------------------------

1. Assuming you are running Raspberry Pi OS (Lite) enable the I2C bus by adding this line to `/boot/config.txt` in section **all**:

   ```sh
   dtoverlay=i2c1,pins_44_45
   ```

2. Install i2c-tools:

   ```sh
   sudo apt-get install i2c-tools
   ```

3. Reboot the control node.

4. Install scripts:

   ```sh
   git clone https://github.com/pmhausen/turingpi-i2c-scripts.git
   cd turingpi-i2c-scripts
   make install
   ```

Usage
-----

```sh
root@pi1:~# nodectl
usage: nodectl <node> on|off
root@pi1:~# nodectl 2 off
root@pi1:~# nodestat
NODE STATE
 1    on
 2    off
 3    on
 4    on
 5    on
 6    on
 7    on
root@pi1:~# nodectl 2 on
root@pi1:~# nodestat
NODE STATE
 1    on
 2    on
 3    on
 4    on
 5    on
 6    on
 7    on
```
