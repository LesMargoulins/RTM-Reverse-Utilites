#!/bin/bash

ISF=$'\n'
TMPFILE=`mktemp -u`
echo "Reading card..."
nfc-mfultralight r $TMPFILE > /dev/null
ALL=`hexdump $TMPFILE | awk -F " " '{print $NF}'`

for line in $ALL;do
    line=$(echo $line | tr '[:lower:]' '[:upper:]')
    if [ "$line" == "0000" ];then
	echo -e "Readed card: \033[32mNot used\033[0m ($line)"
    elif [ "$line" == "8000" ];then
	echo -e "Readed card: \033[33mUsed one time\033[0m ($line)"
    elif [ "$line" == "C000" ];then
	echo -e "Readed card: \033[31mUsed two times\033[0m ($line)"
    elif [ "$line" == "E000" ];then
	echo -e "Readed card: \033[31mUsed three times\033[0m ($line)"
    elif [ "$line" == "F000" ];then
	echo -e "Readed card: \033[31mUsed four times\033[0m ($line)"
    elif [ "$line" == "F800" ];then
	echo -e "Readed card: \033[31mUsed five times\033[0m ($line)"
    elif [ "$line" == "FC00" ];then
	echo -e "Readed card: \033[31mUsed six times\033[0m ($line)"
    elif [ "$line" == "FE00" ];then
	echo -e "Readed card: \033[31mUsed seven times\033[0m ($line)"
    elif [ "$line" == "FF00" ];then
	echo -e "Readed card: \033[33mUsed eight time\033[0m ($line)"
    elif [ "$line" == "FF80" ];then
	echo -e "Readed card: \033[31mUsed nine times\033[0m ($line)"
    elif [ "$line" == "FFC0" ];then
	echo -e "Readed card: \033[31mUsed ten times\033[0m ($line)"
    elif [ "$line" == "FFE0" ];then
	echo -e "Readed card: \033[31mUsed eleven times\033[0m ($line)"
    elif [ "$line" == "FFF0" ];then
	echo -e "Readed card: \033[31mUsed twelves times\033[0m ($line)"
    elif [ "$line" == "FFF8" ];then
	echo -e "Readed card: \033[31mUsed thirteen times\033[0m ($line)"
    elif [ "$line" == "FFFC" ];then
	echo -e "Readed card: \033[31mUsed fourteen times\033[0m ($line)"
    elif [ "$line" == "FFFE" ];then
	echo -e "Readed card: \033[31mUsed fifteen times\033[0m ($line)"
    elif [ "$line" == "FFFF" ];then
	echo -e "Readed card: \033[31mUsed sixteen times\033[0m ($line)"
    else
	echo -e "Readed card: \033[31;1mWtf is this OTP value ? ($line)\033[0m ($line)"
    fi
    break
done
