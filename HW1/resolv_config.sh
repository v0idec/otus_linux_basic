DNS1 = input
DNS2 = input
r_conf = /etc/resolv.conf


CUR_DNS = `grep [ip_addreses] $r_conf"

LIST_CUR = "$CUR_DNS"
LIST_INPUT = "$DNS1 + $DNS2"

#Check inputed dns is correct

CUR_ELEM =  $LIST_CUR
if 2 == $CUR_ELEM:
	echo "Current IP addresses is 2"
else:
	echo "There are more or less  then 2 ip addresses in resolv.conf, check it" 
	exit 2

for ip in $LIST_INPUT:
	if ip == [][][][]
		echo "DNS is correct, next step"
	else:
		echo "DNS is incorrect, write correct ip address,\
			correct DNS format is ip address: \ 
			example: 127.0.0.1"
		exit 2


if $LIST_CUR = $LIST_INPUT:
	echo "resolv.conf configured correclty"
else: 
	echo "Configure resolv.conf"
	sed -e '\e\$LIST_CUR[0]\$LIST_INPUT[0]'
	sed -e '\e\$LIST_CUR[1]\$LIST_INPUT[1]'
		
