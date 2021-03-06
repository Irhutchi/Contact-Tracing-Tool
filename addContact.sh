#!/bin/bash

# This is a program that enables a user to ADD cusomter contact details to the contact tracing log.
# Author: Ian Hutchinson
# Date: Oct 2020

<<COMMENT
	The nature of the data is such that it would not be ideal for it to be stored in peoples command histories etc.
	A good example of this is login credentials (username and password). In these circumstances it is best to read the
	data during script execution.
COMMENT
clear

# ANSI Colour Codes
GREEN='\033[0;32m'
RED='\033[0;31m'
RESET='\033[0m'

echo -e  "${GREEN}Hello, "$USER". This scrip will allow you to add and store customer details.${RESET}"
echo

# infinite loop
while :
do
	echo "Enter fullName and press [Enter]: "
	read fullName
	if [ "${fullName//[!0-9]}" ]; # check input contains string of numbers only.
	then
		echo -e "${RED}Invalid entry. Please try again.${RESET}"
	continue # skip the remaining command
	else
	break #  break out of the loop

	fi
done

while :
do
        echo "Enter Postal Address and press [Enter]: "
        read address
        if [ "$address" = "" ];
        then
        	echo -e "${RED}You have not entered an an address, Please try again.${RESET}"
        continue
        else
        break

        fi
done

while :
do
        echo "Enter mobile number and press [Enter]: "
        read phoneNum
        if [[ ! $phoneNum =~ ^[0-9]+$ ]]; # nums only and no blank space allowed 
        then
        	echo -e "${RED}Invalid entry.Mobile number must contain numbers only.${RESET}"
        continue
        else
        break

        fi
done

while :
do
	echo "Enter Email Address and press [Enter]: "
	read email
	if [[ $email != *"@"* ]];   #if email doesn't contain an @ symbol then invalid
	then
		echo -e "${RED}email must contain special char '@', please enter a valid email.${RESET}"
	continue
	else
	break
	fi

done

z=0

# YesOrNo test case will inside a function will accomodate invalid inputs.
# Function will run until a valid input from user is obtained.
function YesOrNo ()
{
	while [ $z = 0 ]
	do
	echo "Details entered: "$fullName, $address, $phoneNum, $email
        echo -n "Confirm details entered are correct? [yes or no]: - Press 'q' to quit. "
        read word       #wait for the user to type in a word and save that word as a variable

        case $word in
                [yY] | [yY][Ee][Ss] )
                	echo $fullName, $address, $phoneNum, $email, "`date`" >> contactDetails.sh
			echo "Customer details successfully created."
			echo ""
			cat contactDetails.sh
			sleep 3
			./mainMenu.sh
                	z=1             #escape the loop when z equals 1.
                	;;
                [nN] | [n|N][O|o] )
                	echo "Please try again (q to quit)";
                	z=1
                	;;
                [qQ] )
                	z=1
                	echo "Exiting..."
                	sleep 2
                	;;
                *)
                	clear           #clear the screen
                	echo "Invalid input"
                	sleep 2
			YesOrNo  # recall function again
                	;;
        esac
  done
}

YesOrNo
