#!/bin/bash

if [ $# -lt 1 ]; then
	echo $0 expects at least 1 arg
	echo "usage: ./partea2.sh <cale-director> <optional-email-provider>"
	exit 1
fi

if [ $# -eq 1 ]; then
	for file in $1
	do
		if [ -d $file ]; then
			cat $file/* | grep -swHr "[[:alnum:]]\+@gmail\.com$" | sort -t: -k2 | uniq > emails.txt
			echo "adresele au fost returnate in emails.txt"
		else 
			echo $file wrong path
		fi
	done
fi

if [ $# -eq 2 ]; then
	for file in $1
	do
		if [ $2 == "yahoo" ]; then
			cat $file/* | grep -swHr "[[:alnum:]]\+@yahoo\.com$" | sort -t: -k2 | uniq > emails_yahoo.txt
                	echo "adresele au fost returnate in emails_yahoo.txt"
        	else
                	echo $file wrong path or invalid email provider
        	fi
	done
fi

exit 0
