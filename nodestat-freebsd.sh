#! /bin/sh

state=$(/usr/sbin/i2c -a 57 -o f8 -d r -c 1)
state=$((0x${state} >> 1))

echo "NODE STATE"

for node in 1 2 3 4 7 6 5
do
    echo -n " ${node}    "

    if [ $((${state} & 1)) -eq 1 ]
    then
        echo "on"
    else
        echo "off"
    fi
    
    state=$((${state} >> 1))
done | /usr/bin/sort -n
