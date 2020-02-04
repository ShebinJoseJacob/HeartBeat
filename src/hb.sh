#!/bin/bash
counter=1
while [ $counter -le 10 ]
do
        i2cset -y -a 1 0x5b 0x41 0x87
        i2cset -y -a 1 0x5b 0x42 0x00
        i2cset -y -a 1 0x5b 0x43 0x00
        i2cset -y -a 1 0x5b 0x44 0x00
        i2cset -y -a 1 0x5b 0x45 0x00
        i2cset -y -a 1 0x5b 0x46 0x03
	MP=$(($(i2cget -y -a 1 0x5b 0x50)))
	let "n0 = $(($MP*(2**14)))"
	LP=$(( $(i2cget -y -a 1 0x5b 0x51)))
	let "n2 = $(($LP*(2**6)))"
	LSP=$(( $(i2cget -y -a 1 0x5b 0x52)))
	let "n3 = $(($LSP))"
	let "n4 = $n1+$n2+$n3"
	let "p=($n4/2048)"
	echo "Heart Rate $p bpm"
        i2cget -y -a 1 0x5b 0x58
	i2cset -y -a 1 0x5b 0x40 0x80
	sleep 3s
	
done
