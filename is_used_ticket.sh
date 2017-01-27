#!/bin/bash

ISF=$'\n'
if [ $# \> 0 ];then
    while [ $# \> 0 ];do
	if [ "$1" == "-h" ] || [ "$1" == "--help" ];then
	    echo -e "./is_used_ticket.sh [ticket.dump] [ticket2.dump] [ticket3.dump] ...\n Script will check all dumps in current directory if no file specified"
	fi
	ALL=`hexdump $1 | awk -F " " '{print $NF}'`

	for line in $ALL;do
	    line=$(echo $line | tr '[:lower:]' '[:upper:]')
	    if [ "$line" == "0000" ];then
		echo -e "$1: \033[32mNot used\033[0m ($line)"
	    elif [ "$line" == "8000" ];then
		echo -e "$1: \033[33mUsed one time\033[0m ($line)"
	    elif [ "$line" == "C000" ];then
		echo -e "$1: \033[31mUsed two times\033[0m ($line)"
	    elif [ "$line" == "E000" ];then
		echo -e "$1: \033[31mUsed three times\033[0m ($line)"
	    elif [ "$line" == "F000" ];then
		echo -e "$1: \033[31mUsed four times\033[0m ($line)"
	    elif [ "$line" == "F800" ];then
		echo -e "$1: \033[31mUsed five times\033[0m ($line)"
	    elif [ "$line" == "FC00" ];then
		echo -e "$1: \033[31mUsed six times\033[0m ($line)"
	    elif [ "$line" == "FE00" ];then
		echo -e "$1: \033[31mUsed seven times\033[0m ($line)"
	    elif [ "$line" == "FF00" ];then
		echo -e "$1: \033[33mUsed eight time\033[0m ($line)"
	    elif [ "$line" == "FF80" ];then
		echo -e "$1: \033[31mUsed nine times\033[0m ($line)"
	    elif [ "$line" == "FFC0" ];then
		echo -e "$1: \033[31mUsed ten times\033[0m ($line)"
	    elif [ "$line" == "FFE0" ];then
		echo -e "$1: \033[31mUsed eleven times\033[0m ($line)"
	    elif [ "$line" == "FFF0" ];then
		echo -e "$1: \033[31mUsed twelves times\033[0m ($line)"
	    elif [ "$line" == "FFF8" ];then
		echo -e "$1: \033[31mUsed thirteen times\033[0m ($line)"
	    elif [ "$line" == "FFFC" ];then
		echo -e "$1: \033[31mUsed fourteen times\033[0m ($line)"
	    elif [ "$line" == "FFFE" ];then
		echo -e "$1: \033[31mUsed fifteen times\033[0m ($line)"
	    elif [ "$line" == "FFFF" ];then
		echo -e "$1: \033[31mUsed sixteen times\033[0m ($line)"
	    else
		echo -e "$1: \033[31;1mWtf is this OTP value ? ($line)\033[0m ($line)"
	    fi
	    break
	done
	shift
    done
else
    ALL_FILES=`ls -l *.dump | awk -F " " '{print $NF}'`

    for file in $ALL_FILES;do
	ALL=`hexdump $file | awk -F " " '{print $NF}'`

	for line in $ALL;do
	    line=$(echo $line | tr '[:lower:]' '[:upper:]')
	    if [ "$line" == "0000" ];then
		echo -e "$file: \033[32mNot used\033[0m ($line)"
	    elif [ "$line" == "8000" ];then
		echo -e "$file: \033[33mUsed one time\033[0m ($line)"
	    elif [ "$line" == "C000" ];then
		echo -e "$file: \033[31mUsed two times\033[0m ($line)"
	    elif [ "$line" == "E000" ];then
		echo -e "$file: \033[31mUsed three times\033[0m ($line)"
	    elif [ "$line" == "F000" ];then
		echo -e "$file: \033[31mUsed four times\033[0m ($line)"
	    elif [ "$line" == "F800" ];then
		echo -e "$file: \033[31mUsed five times\033[0m ($line)"
	    elif [ "$line" == "FC00" ];then
		echo -e "$file: \033[31mUsed six times\033[0m ($line)"
	    elif [ "$line" == "FE00" ];then
		echo -e "$file: \033[31mUsed seven times\033[0m ($line)"
	    elif [ "$line" == "FF00" ];then
		echo -e "$file: \033[33mUsed eight time\033[0m ($line)"
	    elif [ "$line" == "FF80" ];then
		echo -e "$file: \033[31mUsed nine times\033[0m ($line)"
	    elif [ "$line" == "FFC0" ];then
		echo -e "$file: \033[31mUsed ten times\033[0m ($line)"
	    elif [ "$line" == "FFE0" ];then
		echo -e "$file: \033[31mUsed eleven times\033[0m ($line)"
	    elif [ "$line" == "FFF0" ];then
		echo -e "$file: \033[31mUsed twelves times\033[0m ($line)"
	    elif [ "$line" == "FFF8" ];then
		echo -e "$file: \033[31mUsed thirteen times\033[0m ($line)"
	    elif [ "$line" == "FFFC" ];then
		echo -e "$file: \033[31mUsed fourteen times\033[0m ($line)"
	    elif [ "$line" == "FFFE" ];then
		echo -e "$file: \033[31mUsed fifteen times\033[0m ($line)"
	    elif [ "$line" == "FFFF" ];then
		echo -e "$file: \033[31mUsed sixteen times\033[0m ($line)"
	    else
		echo -e "$file: \033[31;1mWtf is this OTP value ? ($line)\033[0m ($line)"
	    fi
	    break
	done
    done
fi
