#!/bin/bash

# This script allows the user to navigate a menu to carry out different functions relating to customer records.
# Patrons can be added, removed, searched and emailed from
# This menu will allow the user to select from any of the shell scripts listed.

#ps -ef

# ANSI Colour Codes
GREEN='\033[0;32m'
RED='\033[0;31m'
WHITE='\033[0;37m'
RESET='\033[0m'

x=0

while [ $x = 0 ]
do
        # Print menu to user
	clear
	echo -e "${GREEN}Covid-19 Tracing Tool Menu"
        echo -e "${WHITE}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${RESET}"
	echo -e "${GREEN} Please Select:"
	echo
	echo "          0 - Exit..."
        echo "          1 - Add a new  Customer"
        echo "          2 - Remove an existing Customer"
        echo "          3 - Search for a Customer"
        echo -e "          4 - E-mail a Customer${RESET}"
        echo -e "${WHITE}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${RESET}"




	# prompt user to enter a number and store it in var 'response'
	read -p "Enter Selection:  [0-4] > " response

	# case menu: a menu driven system for covid-19 tracing tool
	case "$response" in
		0)	echo "User requested exit..."
	                x=1
			sleep 2
			exit 0
	                ;;
		1)	source /home/compsys/Covid-19_Contact_Log_Tracing/addContact.sh
			#bash addContact.sh
			#./addContact.sh
			x=1
			;;
		2)	./remove.sh
	                x=1
			;;
		3)	./searchCust.sh
	                x=1
			;;
		4)	./emailCust.sh
	                x=1
			;;
	        *)      clear #clear the terminal screen
	                echo -e "${RED}Please Select between 0 to 4 only{RESET}"
	                sleep 2
			clear
			echo "please choose a option between [0-4]"
	                ;;
	esac

done
