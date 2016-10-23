#!/bin/bash

#fetch all submissions. Can only be run by a head TA, since
#they are the ones with permissions to the files. 

#NOTE: this does not fetch submissions that failed the first time
#for whatever reason (see note about this in the submit command).

#Check for those manually (just do an ls on whatever the parent dir is). 

if [[ "$#" -ne 2 ]]
then
	echo "Usage: ./locate <assignment key> <class key>"
	echo "keys are case sensitive; make sure they are all caps"
	exit
fi

echo "Script will check for overrides and regular submissions."
echo "If there are other locations to check, you will have to locate those manually."
sleep 2
echo ""
echo "If students are not found, there will be output to stderr. Check those students"
echo "to make sure their pawprints are okay in the fetch lists."

COUNT=1

for i in $(ls | find -name "${2}*" ! -name "${2}TA" ! -name "*.zip" -maxdepth 1)
do
	echo "..............."
	echo "$i"
	for j in $(cat "$i")
	do
		let COUNT=1
		for k in $(find /home/submissions/"${2}"/"${1}"/"${i}"/"${j}" -name "*.c")
		do
			cp "${k}" ./"$j"_"$COUNT".c
			zip -q "$i"_"$1".zip "$j"_"$COUNT".c
			zip -q "$2"_"$1".zip "$j"_"$COUNT".c
			rm "$j"_"$COUNT".c
			let COUNT=COUNT+1
		done
		
		let COUNT=1
		for k in $(find /home/submissions/override/"${i}"/"${1}" -name "${j}*.c")
		do
			cp "${k}" ./"$j"_"$COUNT".c
			#strangly enough, "$i" has a './' in front of the path. Not sure how to get 
			#rid of it for naming purposes below. 
			zip -q "$i"_override_"$1".zip "$j"_"$COUNT".c
			zip -q "$2"_override_"$1".zip "$j"_"$COUNT".c
			rm "$j"_"$COUNT".c
			let COUNT=COUNT+1
		done
	done
done
