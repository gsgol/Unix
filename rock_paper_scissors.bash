algentok@gmail.com
#!/bin/bash

clear

echo "Welcome, you are playing a rock-paper-scissors game."
echo "Good luck:)"

sleep 2.5s

clear

while [[ true ]]; do

	clear

	echo "1 - rock, 2 - paper, 3 - scissors, 4-rules, 0 - exit "
	echo "Your choice: "
	# shellcheck disable=SC2162
	read userchoice

	check='^[0-9]+$'
	if ! [[ $userchoice =~ $check ]] ; then
	   	echo "Please, input number"
	   	sleep 1.5s
	   	continue
	elif [[ userchoice -eq 0 ]]; then
		clear
		exit
	elif [[ userchoice -eq 4 ]]; then
		echo -e "You need to choose one figure from the following list: rock, paper, scissors.\n"
		echo "Rock beats scissors, paper beats rock, scissors beat paper."
		continue
	elif [[ userchoice -gt 4 ]]; then
		echo "Please, enter number less than or equal to 4"
		sleep 1.5s
		continue
	elif [[ userchoice -lt 0 ]]; then
		echo "Please, enter number greater than or equal to 0"
		sleep 1.5s
		continue
	fi

	# shellcheck disable=SC2219
	# shellcheck disable=SC2004
	let chance=$(($RANDOM%100))

	if [[ chance -le 17 ]]; then

		if [[ userchoice -eq 1 ]]; then
			echo -e "PC choice:\n2"
			echo "PC win! (not fair)"
		elif [[ userchoice -eq 2 ]]; then
			echo -e "PC choice:\n3"
			echo "PC win! (not fair)"
		else
			echo -e "PC choice:\n1"
			echo "PC win! (not fair)"
		fi

	else
		# shellcheck disable=SC2219
		let pcchoice=$((($RANDOM)%3+1))

		if [[ "$userchoice" -eq "$pcchoice"  ]]; then
			echo -e "PC choice:\n$pcchoice"
			echo "Draw"
		# shellcheck disable=SC2166
		elif [ "$userchoice" -eq  1 -a "$pcchoice" -eq 2 -o "$userchoice" -eq 2 -a "$pcchoice" -eq 3 -o "$userchoice" -eq 3 -a  "$pcchoice" -eq 1 ]; then
			echo -e "PC choice:\n$pcchoice"
			echo "You win!"
		else
			echo -e "PC choice:\n$pcchoice"
			echo "PC win! (fair game)"
		fi

	fi

sleep 2.5s

done
