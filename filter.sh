#!/bin/bash 

#since students can submit multiple times,
#the fetch will grab all of them and order them 
#by submission DTTM. 

#this will filter out those files to delete everything
#except the most recent submission. Useful for MOSS. 

PREVPP=""
PAWPRINT=""
PREVFILE=""

for i in $(ls *.c)
do
	PAWPRINT=$(echo "$i" | cut -d_ -f1)
	if [[ ${PREVPP} == ${PAWPRINT} ]] 
	then
		rm ${PREVFILE}
		PREVFILE=${i}	
	else
		PREVPP=${PAWPRINT}
		PREVFILE=${i}	
	fi
done
