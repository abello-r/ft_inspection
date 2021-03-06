#!/bin/sh

# Colors
GREEN=`tput setaf 2`
WHITE=`tput setaf 7`
BLUE=`tput setaf 4`
RESET=`tput sgr0`

abs="$HOME/.ft_inspection"

clear
sh $abs/srcs/.prompt.sh

if [[ "$OSTYPE" == "linux-gnu"* ]]
	then
		echo "${BLUE}You need these dependencies to continue!\n"
		echo "${WHITE}1- ruby\n"
		echo "2- gem install dotenv\n"
		echo "3- gem install colorize\n"
		echo "4- gem install oauth2\n\n"
		echo "\n${BLUE}Do you want to install all packages? [y/n]${RESET}\n"
		read perm
		if [[ "$perm" == "y" ]]
			then
				sudo apt update
				apt install ruby --user-install
				gem install dotenv --user-install
				gem install colorize --user-install
				gem install oauth2 --user-install
			else
				:
		fi
fi

if [[ "$OSTYPE" == "darwin"* ]]
	then
		#BREW
		echo "${WHITE}Do you want install Brew? [y/n]\n"
		read perm2
		echo "\n"
		if [[ "$perm2" == "y" ]]
			then
				git clone --depth=1 https://github.com/Homebrew/brew $HOME/.brew && export PATH=$HOME/.brew/bin:$PATH && brew update && echo "export PATH=$HOME/.brew/bin:$PATH" >> ~/.zshrc
			else
				:
		fi
		#RUBY
		if [ -f /usr/bin/ruby ]
			then
				gem install dotenv --user-install
				gem install colorize --user-install
				gem install oauth2 --user-install
				echo "${BLUE}Updated\n"
		else
			brew install ruby
			gem install dotenv --user-install
			gem install colorize --user-install
			gem install oauth2 --user-install
		fi
fi
