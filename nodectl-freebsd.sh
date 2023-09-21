#! /bin/sh

if [ $# -ne 2 ]
then
	echo "usage: nodectl <node> on|off" >&2
	exit 1
fi

case ${1} in
	2)
		reg=4
	;;
	3)
		reg=8
	;;
	4)
		reg=16
	;;
	5)
		reg=128
	;;
	6)
		reg=64
	;;
	7)
		reg=32
	;;
	*)
		echo "<node> must be in range 2-7" >&2
		exit 1
	;;
esac

state=$(/usr/sbin/i2c -a 57 -o f8 -d r -c 1)
state=$((0x${state}))

case $2 in
	on)
		cmd=$(/usr/bin/printf '0x%02x\n' $((${state} | ${reg})))
	;;
	off)
		cmd=$(/usr/bin/printf '0x%02x\n' $((${state} & ~ ${reg})))
	;;
	*)
		echo "command must be 'on' or 'off'" >&2
		exit 1
	;;
esac

echo ${cmd} | /usr/local/bin/xxd -r | /usr/sbin/i2c -a 57 -o f2 -d w -c 1
exit 0
