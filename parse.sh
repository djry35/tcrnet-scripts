#!/bin/bash

#This preps the group files located in this directory by
#parsing the /etc/group file. The groups located there 
#define who is in what group/section/etc, but that format 
#is not friendly to the fetch script. Thus everyone is 
#distributed to files labled by the section.


#NOTE: /etc/group was prepped using the class roster. 
#All aliases have to be double-checked to make sure that 
#no other (more normal looking) pawprints exist for that student,
#since they probably use a more normal pawprint when logging into 
#this server.

#To fix, open up their group listing file and change it manually.
#Also notify the rnet people that /etc/group needs to be changed. 

#example: huiming.sun is not a normal pawprint. Nor is dc.wash95. 
#They might use those to login to the server, but you have to double-check it. 


for i in $(cat /etc/group | grep "CS[12]050") 
do
	f=$(echo "$i" | awk -F: '{print $1}')
	for k in $(echo "$i" | awk -F: '{print $4}' | awk -F, '{for(j = 1; j <= NF; j++) print $j}')
	do
		echo "$k" >> "$f"
	done
done
