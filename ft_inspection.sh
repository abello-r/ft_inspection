#!/bin/sh

# Colors
GREEN=`tput setaf 2`
CYAN=`tput setaf 6`
BLUE=`tput setaf 4`
RESET=`tput sgr0`

# Init
sh srcs/.prompt.sh

if [ -f srcs/ready ]
	then
		:
	else
		mv srcs/mount srcs/ready
		sh srcs/.install.sh
fi

if [ -f srcs/.env ]
	then
		sh srcs/.prompt.sh
		ruby srcs/menu.rb
	else
		# Ad
		echo "\nIf you don't have your keys yet, you can get them at ${CYAN}https://profile.intra.42.fr/oauth/applications${RESET}\n"
		
		# Fill UID camp
		echo "${BLUE}Enter your UID key ...${RESET}"
		read FILL_UID
		echo "${CYAN}Received [${FILL_UID}] [OK]${RESET}"
		sleep 2s

		# Fill SECRET camp
		echo "${BLUE}Now enter your SECRET key ... ${RESET}"
		read FILL_SECRET
		echo "${CYAN}Received [${FILL_SECRET}] [OK] ${RESET}"
		sleep 2s

		# Create .env file
		echo "${CYAN}Your configuration is being created ...${RESET}"
		echo 'UID='$FILL_UID > srcs/.env
		echo 'SECRET='$FILL_SECRET >> srcs/.env
		echo 'URL=https://api.intra.42.fr/oauth/token' >> srcs/.env
		sleep 3
		sh srcs/.prompt.sh
		ruby srcs/menu.rb
fi
