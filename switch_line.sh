#!/bin/sh

LINESWITCH=$1
if [ $LINESWITCH = 1 ]
then
	# sudo route add default gw 192.168.1.2
	# ping -c 3 www.163.com
	msg=$(ping -c 3 www.163.com &> /dev/null && echo success || echo fail)
	if [ $msg = 'success' ]
	then
		export LINESWITCH=1
		echo $msg "欢迎专线上网！"
	else
		echo $msg "专线上网失败！"
	fi
elif [ $LINESWITCH = 2 ]
then
	# sudo route del default gw 192.168.1.2
	# ping -c 3 www.google.com.hk
	msg=$(ping -c 3 www.google.com.hk &> /dev/null && echo success || echo fail)
	if [ $msg = 'success' ]
	then
		export LINESWITCH=2
		echo $msg "欢迎科学上网！"
	else
		export LINESWITCH=2
		echo $msg "科学上网失败！"
	fi
else
	echo "网关未定义，只支持1和2"
fi
