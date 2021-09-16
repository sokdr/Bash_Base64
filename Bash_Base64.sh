#!/bin/bash

#written by sokdr
#https://github.com/sokdr
# 09/2021

trap ctrl_c INT

ctrl_c() {
        echo "** exit....CTRL-C"
        exit 0
}


echo "Welcome to Base64 encoding/decoding"
echo
echo "1. Encode."
echo "2. Decode."
echo "3. Enter Path for Encoding."
echo "4. Enter Path for Decoding."
echo
echo -n "please enter your option: " 
read option
echo

if [[ $option = 1 ]]; then
	echo -n "enter string for Encoding: "
	read string 
	echo
	echo $string | base64 
elif [[ $option = 2 ]]; then
	echo -n "enter Base64 for Decoding: "
	read string1
	echo
	echo $string1 | base64 --decode 
elif [[ $option = 3 ]]; then
	echo -n "Encode a txt file/Provide full path: "
	read userpath
	if [[ -f "$userpath" ]]; then
		echo "Encoding file"
		echo
		while IFS= read -r line; do
			echo -n "$line" && echo -n "|x|" && echo $line | base64
		 done < "$userpath"
	else
		echo "path does not exist"
		exit 0
	fi
elif [[ $option = 4 ]]; then
	echo -n "Decode a txt file/Provide full path: "
	read userpath
	if [[  -f "$userpath" ]]; then
		echo "Decoding file"
		echo
		while IFS= read -r line; do
			echo -n "$line" && echo -n "|x|" && echo $line | base64 --decode 
		done < "$userpath"
	else
		echo "path does not exist"
		exit 0
	fi
else 
	echo "Select an option 1, 2, 3, 4 " 2>/dev/null
	exit 0
fi

exit 0
