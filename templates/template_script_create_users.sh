#!/bin/bash

CHANGEME_PASSWORD="changeme"  # Default password
LIST_USERS={{ my_list_users }}  # List users seperated by spaces
#EXPIRATION_TIME='+12 months'
SUDO_COMMAND="/bin/su -"


for user in $LIST_USERS
	do
		echo -e "\e[0;34m$user :\e[0;m\n"
		# useradd $user -G user_applicatif  # Comme groupe secondaire "user_applicatif"
		useradd $user
		echo $CHANGEME_PASSWORD | passwd --stdin $user
		chage -d 0 $user  # Mot de passe sera forcé de changer à la première connexion
		chage -E '+12 months' $user  # Le compte expirera dans X mois
		echo "$user $HOSTNAME=$SUDO_COMMAND" >> /etc/sudoers  # Ajout d'un sudo root au user
	done