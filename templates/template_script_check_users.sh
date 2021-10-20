#!/bin/bash

LIST_USERS={{ my_list_users }}  # List users seperated by spaces

for user in $LIST_USERS
	do
		echo -e "\e[0;34m$user :\e[0;m\n"
		grep $user /etc/sudoers
		chage -l $user | grep -e 'Last password change' -e 'Account expires'
		id $user
	done