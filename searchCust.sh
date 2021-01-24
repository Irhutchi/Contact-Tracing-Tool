#!/bin/bash

clear

awk 'BEGIN { print"Name\t\t\t  Email\t\t\t   Date of Vist"   #print the title line once
}
	echo
        # statement below- width of the output is numeric and left-justified using '%-' minus
        {FS=","}{printf"%-23s %-25s %-15s \n", $1,$4,$5}

END {print "End of list"}' contactDetails.sh

echo

read -p "Search name of person in database:  >" fullName

# quietly searching the patterned entered against the conact details file.
if grep -q "$fullName" contactDetails.sh; then
	# search pattern in contact details, print name and email and finally order ouptut in using sort.
	echo "Name of Person: " $(grep -ncwi $fullName contactDetails.sh | awk -F',' '{print $2, $4;}' | sort -f )
	grep -niw $fullName contactDetails.sh  | awk -F ',' '{print $1, $3, $4;}'
	#echo Date of visit: " $(grep -ncwi `$date` contactDetails.sh)
else
	echo "No match found."
	#sleep 3 && ./mainMenu.sh
fi

read -p " would you like to complete another search? (Q to quit) > " response

case $response in
        [yY] | [yY][Ee][Ss] )
                echo "Redirecting..." && sleep 3
                ./searchCust.sh
                ;;
        [nN] | [n|N][O|o] )
                echo "Unsure? Better safe than sorry I say!"
	        ./mainMenu.sh
	        ;;
        [qQ] )
	        echo "Exiting..."
	        sleep
		;;
        *)
	        echo -e "${RED}invalid input${RESET}"
	        sleep 2
	        ;;
esac
