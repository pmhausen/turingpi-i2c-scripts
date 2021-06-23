Two small scripts to make control of compute nodes on a TuringPi easier
=======================================================================

Installation on control node
----------------------------

1. Enable the i2c bus by adding this line to `/boot/firmware/usercfg.txt`:
   ```
   dtoverlay=i2c1,pins_44_45
   ```

2. Install i2c-tools:
   ```
   sudo apt-get install i2c-tools
   ```

3. Reboot the control node.

4. Install scripts:
   ```
   git clone https://github.com/pmhausen/turingpi-i2c-scripts.git
   cd turingpi-i2c-scripts
   sudo cp nodectl.sh /usr/local/sbin/nodectl
   sudo cp nodestat.sh /usr/local/sbin/nodestat
   sudo chmod 755 /usr/local/sbin/nodectl /usr/local/sbin/nodestat
   sudo chown root:root /usr/local/sbin/nodectl /usr/local/sbin/nodestat
   ```

Usage
-----

```
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
root@pi1:~# 
```
