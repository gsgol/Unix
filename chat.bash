#!/bin/bash

echo "enter password"
read passw
touch chat.txt
openssl enc -aes-256-cbc -k -salt -in chat.txt -out chat.enc -k passw
rm -f chat.txt

trap "openssl enc -aes-256-cbc -d -in chat.enc -out chat.txt -k passw | cat chat.txt" 8
rm -f chat.txt
echo my_id = $$
echo "enter id of comp"
read id

while true 
do
	read text
	openssl enc -aes-256-cbc -d -in chat.enc -out chat.txt -k passw
	echo "$text" > chat.txt
	rm -f chat.txt
	kill -8 $id
done
