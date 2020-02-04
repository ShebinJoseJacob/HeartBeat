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
	
	MH=$(($(i2cget -y -a 1 0x5b 0x50)))
	let "n0 = $(($MH*(2**14)))"
	LH=$(( $(i2cget -y -a 1 0x5b 0x51)))
	let "n2 = $(($LH*(2**8)))"
	LSH=$(( $(i2cget -y -a 1 0x5b 0x52)))
	let "n3 = $(($LSH))"
	LSSH=$(( $(i2cget -y -a 1 0x5b 0x53)))
	let "n4 = $(($LSSH))"
	let "n5 = $n1+$n2+$n3+$n4"
	let "h=($n5/910)"
	echo "Heart Rate $h bpm"

	i2cset -y -a 1 0x5b 0x40 0x80
	sleep 3s
	
done

