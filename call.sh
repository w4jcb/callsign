#!/bin/bash

# By Carlton Bryan w4jcb.com (GNU/General Public License version 2.0)

set -e

# Functions:

clear #Clears the screen

leave() {
clear
echo "--------------------"
echo "- Exiting W4JCB Callsign Lookup… Goodbye! -"
echo "--------------------"
exit
}

pas()
{
# sleep 1
echo
echo
read -p "Press Enter to continue" 
}


call_sign()
{

# clear
# shows Callsign info

callsign=$1

if [[ -z "$callsign" ]]; then
	echo "No input entered"
	return 
fi

CALL=$(echo $callsign | tr [:lower:] [:upper:])

#search for callsign in EN.dat file and print details on the screen
LOOKCALL=$(cat EN.dat | awk "/$CALL/ "' { print $0 }')
NAME=$(echo $LOOKCALL | awk -F "|" '{print $9, $10, $11}')
ADDRESS=$(echo $LOOKCALL | awk -F "|" '{print $17, $18, $19}')

echo
echo "Callsign => " $CALL
echo "NAME => " $NAME
echo "ADDRESS => " $ADDRESS
	
}

# Execution.

selection="1"
until [ $selection = " " ]; do

cat << _EOF_

Enter Callsign or press q to quit:

_EOF_


read selection  
case $selection in
1) call_sign;pas;clear;;
2) help;pas;clear;;
q) leave;pas;clear;;
*) clear;call_sign $selection;;
esac
done
