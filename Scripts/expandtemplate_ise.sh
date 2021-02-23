#!/bin/bash

cat $1 | while read a; do
	b=${a,,}
	if [ "${b: -4}" = ".rom" ]; then
		echo "xfile add \"$2/${a%.rom}_word.vhd\""
	fi
	if [ "${b: -4}" = ".vhd" ]; then
		echo "xfile add \"$2/${a}\""
	fi
	if [ "${b: -4}" = ".ucf" ]; then
		echo "xfile add \"$2/${a}\""
	fi
	if [ "${b: -2}" = ".v" ]; then
		echo "xfile add \"$2/${a}\""
	fi
	if [ "${b: -4}" = ".qip" ]; then
		bash ../../../Scripts/expandtemplate_ise.sh $2/${a%.qip}.files $2/$(dirname $a)
	fi
done

