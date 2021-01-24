#!/bin/bash

#search for a name in the database
read -p "enter the user you wish to email: " name
emailaddr=`grep -ni "$name" contactDetails.sh  | awk -F ',' '{print $4}'`

mail $emailaddr -s "message for \"$name\""
