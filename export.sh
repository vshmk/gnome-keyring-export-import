#!/bin/bash

ls -d /home/$USER/.local/share/remmina/* | while read filename; do
	name="$(cat $filename | grep -E '^name=.+' | sed 's/name=//g')"
	password=$(secret-tool lookup key password filename $filename)
	echo "$name $filename $password"
 done
