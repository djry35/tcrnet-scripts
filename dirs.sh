#!/bin/bash

#generate directories for all lab sections based
#off the hardcoded name. 

#Used if class list is expanded or extra 
#folders have to be made for whatever reason.

a=({A..M})

for i in $(find ./CS1050 -name "*LAB*")
do
	echo "$i"
	COUNT=0
	while [[ COUNT -lt 13 ]]; do
		mkdir "$i"/"CS1050${a[$COUNT]}"
		chgrp headTA "$i"/"CS1050${a[$COUNT]}"
		chmod 773 "$i"/"CS1050${a[$COUNT]}"
		let COUNT=COUNT+1
	done
	echo "-----------"
done
