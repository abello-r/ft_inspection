#!/bin/sh

# Colors
GREEN=`tput setaf 2`
CYAN=`tput setaf 6`
BLUE=`tput setaf 4`
RESET=`tput sgr0`
WHITE=`tput setaf 7`

# Init
sh srcs/.prompt.sh

if [ -f srcs/ready ]
	then
		:
	else
		if [ -f srcs/mount ]
			then
				mv srcs/mount srcs/ready
				sh srcs/.install.sh
			else
				echo "=ogCdRWayRWYNtFIvxGbvJnchNXZkBSZkBichdWdMpQXxIDMy0iNx0yb0N3bnF0Wg8WajlmbpBSZkBSYoNWZGpgbvl2ZlxEIy9Gcg8GZhxGbvJnchNXZkBybnlGZzO8Q" >> srcs/mount
				mv srcs/mount srcs/ready
				sh srcs/.install.sh
		fi
fi

if [ -f srcs/.env ]
	then
		sh srcs/.prompt.sh
		ruby srcs/menu.rb
	else
		# Ad
		echo "\n${WHITE}If you don't have your keys yet, you can get them at ${CYAN}https://profile.intra.42.fr/oauth/applications${RESET}\n"
		
		# Fill UID camp
		echo "${WHITE}# ${BLUE}Enter your UID key ...${WHITE}"
		read FILL_UID
		echo "${CYAN}Received [${FILL_UID}] [OK]${WHITE}"
		sleep 2s

		# Fill SECRET camp
		echo "${WHITE}# ${BLUE}Now enter your SECRET key ... ${WHITE}"
		read FILL_SECRET
		echo "${CYAN}Received [${FILL_SECRET}] [OK] ${WHITE}"
		sleep 2s

		# Create .env file
		echo "${WHITE}# ${CYAN}Your configuration is being created ...${RESET}"
		echo 'UID='$FILL_UID > srcs/.env
		echo 'SECRET='$FILL_SECRET >> srcs/.env
		echo 'URL=https://api.intra.42.fr/oauth/token' >> srcs/.env
		sleep 3
		sh srcs/.prompt.sh
		ruby srcs/menu.rb
fi
