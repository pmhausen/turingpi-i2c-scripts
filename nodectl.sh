#! /bin/sh

if [ $# -ne 2 ]
then
	echo "usage: nodectl <node> on|off" >&2
	exit 1
fi

case ${1} in
	2)
		reg=0x04
	;;
	3)
		reg=0x08
	;;
	4)
		reg=0x10
	;;
	5)
		reg=0x80
	;;
	6)
		reg=0x40
	;;
	7)
		reg=0x20
	;;
	*)
		echo "<node> must be in range 2-7" >&2
		exit 1
	;;
esac

case $2 in
	on)
		cmd=0xff
	;;
	off)
		cmd=0x00
	;;
	*)
		echo "command must be 'on' or 'off'" >&2
		exit 1
	;;
esac

/usr/sbin/i2cset -m ${reg} -y 1 0x57 0xf2 ${cmd}
exit 0
