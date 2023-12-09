#!/bin/bash

while read row; do
    name=$(echo $row | grep -Po '.+?(?= \/home)')
	filename=$(echo $row | grep -Po '/home.+\.remmina')
	password=$(echo $row | grep -Po '(?<=.remmina ).+')
	if [[ ! $password == "" ]]; then
		echo -n $password | secret-tool store --label="Remmina: $name - password" filename $filename key password
		echo "password for $name is set"
	fi
done < $1