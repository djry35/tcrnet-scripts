#!/bin/bash

COUNT=1

for i in $(ls | find -name "CS2050*" ! -name "CS2050TA" ! -name "*.zip")
do
	echo "..............."
	echo "$i"
	for j in $(cat "$i")
	do
		let COUNT=1
		for k in $(find ~/submissions/override/"$i"/LAB4 -name "*${j}*.c")
		do
			echo "$k"
			cp "$k" ./"$j"_"$COUNT".c
			zip -q "$i"_LAB3.zip "$j"_"$COUNT".c
			zip -q CS2050_LAB3.zip "$j"_"$COUNT".c
			rm "$j"_"$COUNT".c
			let COUNT=COUNT+1
		done
	done
done
