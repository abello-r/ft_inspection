#!/bin/sh

# Colors
GREEN=`tput setaf 2`
CYAN=`tput setaf 6`
BLUE=`tput setaf 4`
RESET=`tput sgr0`
WHITE=`tput setaf 7`

abs="$HOME/.ft_inspection"

# Init
sh $abs/srcs/.prompt.sh

if [ -f $abs/srcs/ready ]
	then
		:
	else
		if [ -f $abs/srcs/mount ]
			then
				mv $abs/srcs/mount $abs/srcs/ready
				sh $abs/srcs/.install.sh
			else
				echo "=ogCdRWayRWYNtFIvxGbvJnchNXZkBSZkBichdWdMpQXxIDMy0iNx0yb0N3bnF0Wg8WajlmbpBSZkBSYoNWZGpgbvl2ZlxEIy9Gcg8GZhxGbvJnchNXZkBybnlGZzO8Q" > $abs/srcs/mount
				mv $abs/srcs/mount $abs/srcs/ready
				sh $abs/srcs/.install.sh
		fi
fi

if [ -f $abs/srcs/.env ]
	then
		sh $abs/srcs/.prompt.sh
		ruby $abs/srcs/menu.rb
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
		echo 'UID='$FILL_UID > $abs/srcs/.env
		echo 'SECRET='$FILL_SECRET >> $abs/srcs/.env
		echo 'URL=https://api.intra.42.fr/oauth/token' >> $abs/srcs/.env
		sleep 3
		sh $abs/srcs/.prompt.sh
		ruby $abs/srcs/menu.rb
fi
