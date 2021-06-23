#! /bin/sh

state=$(/usr/sbin/i2cget -y 1 0x57 0xf8)
state=$((${state} >> 1))

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
