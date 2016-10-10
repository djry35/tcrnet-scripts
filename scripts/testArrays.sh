#This is testing said magic from submit script, 
#where arrays are passed to functions.

#Turns out not as easy as individual variables.

declare -A V

V[asdf]="CS2050"
V[zxcv]="CS1050"

test ()
{
	eval "declare -A V2="${2#*=}
	for c in "${!V2[@]}"
	do
		echo "$c"
		if [[ "$c" == "$1" ]]
		then 
			return 1
		fi
	done

	return 0
}

test "$1" "$(declare -p V)" 
r=$?

echo "$r"
