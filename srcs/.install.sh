#!/bin/sh

# Colors
GREEN=`tput setaf 2`
BLUE=`tput setaf 4`
RESET=`tput sgr0`

clear
sh srcs/.prompt.sh

if [[ "$OSTYPE" == "linux-gnu"* ]]
	then
		echo "${BLUE}You need these dependencies to continue!\n"
		echo "1- ruby\n"
		echo "2- gem install dotenv\n"
		echo "3- gem install colorize\n"
		echo "4- gem install oauth2\n"
		echo "\n${BLUE}Do you want to install all packages? [y/n]\n"
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
		echo "${BLUE}Do you want install Brew? [y/n]\n"
		read perm2
		if [[ "$perm2" == "y" ]]
			then
				git clone --depth=1 https://github.com/Homebrew/brew $HOME/.brew && export PATH=$HOME/.brew/bin:$PATH && brew update && echo "export PATH=$HOME/.brew/bin:$PATH" >> ~/.zshrc
			else
				:
		fi
		#RUBY
		if [ -f /usr/bin/ruby ]
			then
				echo 'export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.7.0/bin:$PATH"' >> ~/.zshrc
				source ~/.zshrc
				gem install dotenv --user-install
				gem install colorize --user-install
				gem install oauth2 --user-install
				echo "${BLUE}Updated\n"
		else
			brew install ruby
			echo 'export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.7.0/bin:$PATH"' >> ~/.zshrc
			source ~/.zshrc
			gem install dotenv --user-install
			gem install colorize --user-install
			gem install oauth2 --user-install
		fi
fi
