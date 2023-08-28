#!/bin/bash

echo "Enter directory"
read -e -p "Directory:" DIR
#DIR="/home/apfedotkin/otus_hw/linux_basic/test_files/"


function try_file { 	
	if [ -f "$1" ]; then
		for f in $1;
		do
			if [ -f "$f" ]; then
				rm -rf "$f"
				echo "Bak file $f is deleted"	
			fi
		done
	else	
		echo "there are no bak file here"
		exit 2
	fi
}

if [ ! -d "$DIR" ]; then
	echo "dir not exist"
	exit 2
fi

if [ "$?" -eq 0 ]; then
	echo "Check for files"
	rem_bak="$(find $DIR -name "*.bak")"
	rem_backup="$(find $DIR -name "*.backup")"
	rem_tmp="$(find $DIR -name "*tmp")"
	try_file "$rem_backup"
	try_file "$rem_bak"
	try_file "$rem_tmp"
	# if [ -f "$rem_bak" ]; then
	# 	for f in $rem_bak;
	# 	do
	# 		if [ -f "$f" ]; then
	# 			rm -rf "$f"
	# 			echo "Bak file $f is deleted"	
	# 		fi
	# 	done
	# else	
	# 	echo "there are no bak file here"
	# 	exit 2
	# fi
	# if [ -f "$rem_backup" ]; then
	# 	for f in $rem_backup;
	# 	do
	# 		if [ -f "$f" ]; then
	# 			rm -rf "$f"
	# 			echo "Backup file $f is deleted"	
	# 		fi
	# 	done
	# else	
	# 	echo "there are no backup file here"
	# 	exit 2
	# fi
	# if [ -f "$rem_tmp" ]; then
	# 	for f in $rem_tmp;
	# 	do
	# 		if [ -f "$f" ]; then
	# 			rm -rf "$f"
	# 			echo "Tmp file $f is deleted"	
	# 		fi
	# 	done
	# else	
	# 	echo "there are no tmp file here"
	# 	exit 2
	# fi

fi 
	