#!/bin/sh

# Colors
GREEN=`tput setaf 2`
BLUE=`tput setaf 4`
RESET=`tput sgr0`

# Init
sh srcs/.prompt.sh

if [ -f /Users/*/.brew ]
	then
		sleep 0.1
	else
		git clone --depth=1 https://github.com/Homebrew/brew $HOME/.brew && echo 'export PATH=$HOME/.brew/bin:$PATH' >> $HOME/.zshrc && source $HOME/.zshrc && brew update
fi

if [ -f /usr/bin/ruby ]
	then
		sleep 0.1
	else
		brew install ruby
		gem install oauth2
		gem install colorize
		gem install dotenv
fi

if [ -f .env ]
	then
		sh srcs/.prompt.sh
		ruby srcs/menu.rb
	else
		alias pect="sh /Users/abello-r/Desktop/ft_inspect/ft_inspection.sh"
		source ~/.zshrc
		# Ad
		echo "\nIf you don't have your keys yet, you can get them at https://profile.intra.42.fr/oauth/applications\n"
		
		# Fill UID camp
		echo "${BLUE}Enter your UID key ...${RESET}"
		read FILL_UID
		echo "${GREEN}Received [${FILL_UID}] [OK]${RESET}"
		sleep 2s

		# Fill SECRET camp
		echo "${BLUE}Now enter your SECRET key ... ${RESET}"
		read FILL_SECRET
		echo "${GREEN}Received [${FILL_SECRET}] [OK] ${RESET}"
		sleep 2s

		# Create .env file
		echo "${GREEN}Your configuration is being created ...${RESET}"
		echo 'UID='$FILL_UID > .env
		echo 'SECRET='$FILL_SECRET >> .env
		echo 'URL=https://api.intra.42.fr/oauth/token' >> .env
		sleep 3
		sh srcs/.prompt.sh
		ruby srcs/menu.rb
fi
