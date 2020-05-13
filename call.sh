#!/bin/bash

# By Carlton Bryan w4jcb.com (GNU/General Public License version 2.0)

# Set BASH to quit script and exit on errors:

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

help() {
clear #Clears the screen
cat << _EOF_

Callsign Lookup is a tool that will look up callsigns in the FCC *DAT* file 
EN.dat 

By Carlton Bryan www.w4jcb.com (GNU/General Public License version 2.0)

_EOF_
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
# shows Callsign info

#read user input
read -p "Please enter callsign:" callsign

if [[ -z "$callsign" ]]; then
	echo "No input entered"
	return 
fi

CALL=$(echo $callsign | tr [:lower:] [:upper:])

#search for callsign in EN.dat file and print details on the screen
LOOKCALL=$(cat EN.dat | awk "/$CALL/ "' { print $0 }')
# awk '/W4JCB/ { print }' EN.txt # This prints record 

NAME=$(echo $LOOKCALL | awk -F "|" '{print $9, $10, $11}')
ADDRESS=$(echo $LOOKCALL | awk -F "|" '{print $17, $18, $19}')

#echo "FCC Database => " $LOOKCALL
echo
echo "Callsign => " $CALL
echo "NAME => " $NAME
echo "ADDRESS => " $ADDRESS
	
}


# Execution.

selection="1"
until [ $selection = " " ]; do

cat << _EOF_
Press the number of your choice:


1 – Callsign lookup.
2 – Help.
3 - Exit Callsign lookup.

Each number corresponds to a script function or a set of simple commands.
_EOF_


read selection  
case $selection in
1) call_sign;pas;clear;;
2) help;pas;clear;;
3) leave;pas;clear;;
*) echo "Not a valid choice: Please try again.";pas;clear;;
esac
done
