#!/bin/bash

echo "Enter directory"
read -e -p "Directory:" DIR


function try_file { 	
	if [ -f "$1" ]; then
		for f in $1;
		do
			if [ -f "$f" ]; then
				rm -rf "$f"
				echo "$2 file $f is deleted"	
			fi
		done
	else	
		echo "there are no $2 file here"
		exit 2
	fi
}


if [ ! -d "$DIR" ]; then
	echo "dir not exist"
	exit 2
fi


if [ "$?" -eq 0 ]; then
	rem_bak="$(find "$DIR" -name "*.bak")"
	rem_backup="$(find "$DIR" -name "*.backup")"
	rem_tmp="$(find "$DIR" -name "*tmp")"
	try_file "$rem_backup" "Backup"
	try_file "$rem_bak" "Bak"
	try_file "$rem_tmp" "Tmp"
fi 
	