function pars()
{
	case $1 in
	[Нн][Оо][Лл][ЬьЪъ])return 0;;
	[ОоАа][ДдТт][Ии][Нн])return 1;;
	[ДдТт][Вв][Аа])return 2;;
	[Тт][Рр][Ии])return 3;;
	[Чч][ЕеИи][Тт][ЫыИи][Рр][ЕеИи])return 4;;
	[Пп][Яя][Тт][ЬьЪъ])return 5;;
	[Шш][ЕеИи][Сс][Тт][ЬьЪъ])return 6;;
	[Сс][ЕеИи][Мм][ЬьЪъ])return 7;;
	[Вв][ОоАа][Сс][ЕеИи][Мм][ЬьЪъ])return 8;;
	[Дд][Ее][Вв][Яя][Тт][ЬьЪъ])return 9;;
	[Пп][Лл][ЮюУу][Сс])echo '+';;
	[Мм][ИиЕе][Нн][УуЮю][Сс])echo '-';;
	[Уу][МмНн][НнМм][Оо][Жж][ИиЕе][Тт][ЬьЪъ])echo '*';;
	[Дд][ЕеИи][Лл][Ии][Тт][ЬьЪъ])echo '/';;
	*)return 99;; 
	esac
	return 0
}

echo -e "Let's start\n"
while true
do
	echo -en "Enter the first number\n>"
	read first
	while true
	do
		if [[pars $first -eq  99]]; then
			echo -en "Wrong first number\n>"
			echo -en "Enter the first number one more time\n>"
			read first

		else
			break
		
		fi
	done
	first = $?
	echo -en "Enter the second number\n>"
	read second
	while true
	do
		if [[pars $second -eq  99]]; then
			echo -en "Wrong second number\n>"
			echo -en "Enter the second number one more time\n>"
			read first

		else
			break
		
		fi
	done
	second=$?
	echo -en "Enter the operation\n>"
	read op
	while true
	do
		if [[pars $op -eq  99]]; then
			echo -en "Wrong operation\n>"
			echo -en "Enter the operation one more time\n>"
			read op

		else
			break
		
		fi
	done
	op=`pars $op
	echo -n "Result:"
	expr $first "$op" $second
done
