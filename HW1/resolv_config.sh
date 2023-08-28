#!/bin/bash

# read -p "Directory:" DNS1
# read -p "Directory:" DNS2
DNS1="1.1.1.1"
DNS2="8.8.8.8"
r_conf=resolv.conf
CUR_DNS=$(grep "nameserver" $r_conf | grep -o "[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}.[0-9]\{1,3\}")
LIST_CUR=($CUR_DNS)
LIST_INPUT=($DNS1 $DNS2)
dns_qty=${#LIST_CUR[*]}
dns_qty2=${#LIST_INPUT[*]}


function dns_nums_check {
	if [ "$1" == 2 ]; then
		echo "Okey"
	else
		echo "Need 2 DNS servers"
#		exit 1
	fi
}


function check_ip_format {
	for ip in $1
	do
		IFS='.' read -ra array_oktet <<< "$ip"
		ip_oktets_qty=${#array_oktet[*]}
		if  [ "$ip_oktets_qty" -gt 4 ]; then 
			echo "Incorrect IP format, lots of number"
		fi
				for oktet in "${array_oktet[@]}"
				do
					if [ "$oktet" -le 255 ]; then
						echo "Oktet is correct"
					else
						echo "Incorrect oktet"
					fi
				done
	done

}


function file_check {
	if [ -w "$1" ]; then
		echo "We can write, let's go"
	else	
		echo "We can't write here"
		
	fi
}


dns_nums_check "$dns_qty2"
check_ip_format "${LIST_INPUT[*]}"	
file_check "$r_conf"

# CUR_ELEM =  $LIST_CUR
# if 2 == $CUR_ELEM:
# 	echo "Current IP addresses is 2"
# else:
# 	echo "There are more or less  then 2 ip addresses in resolv.conf, check it" 
# 	exit 2

# for ip in $LIST_INPUT:
# 	if ip == [][][][]
# 		echo "DNS is correct, next step"
# 	else:
# 		echo "DNS is incorrect, write correct ip address,\
# 			correct DNS format is ip address: \ 
# 			example: 127.0.0.1"
# 		exit 2


# if $LIST_CUR = $LIST_INPUT:
# 	echo "resolv.conf configured correclty"
# else: 
# 	echo "Configure resolv.conf"
# 	sed -e '\e\$LIST_CUR[0]\$LIST_INPUT[0]'
# 	sed -e '\e\$LIST_CUR[1]\$LIST_INPUT[1]'

# echo "$dns_qty"
# echo "${LIST_CUR[*]}"
# echo "$dns_qty2"
# echo "${LIST_INPUT[*]}"		
