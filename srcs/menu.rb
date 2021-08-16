require "colorize"

def ft_menu

	opt_usr = 0;

	# Menu Options
	print "{1}--| ".cyan.bold; puts ""
	print "{2}--| ".cyan.bold; puts ""
	print "{3}--| ".cyan.bold; puts ""
	print "{4}--| ".cyan.bold; puts ""
	print "{5}--| ".cyan.bold; puts ""
	print "{6}--| ".cyan.bold; puts ""
	print "{7}--| ".cyan.bold; puts "See status token".bold
	print "{8}--| ".cyan.bold; puts "Edit API token".bold
	print "{0}--| ".cyan.bold; puts "Update".bold
	print "{99}-| ".cyan.bold; print "Exit\n\n".bold
	
	# Command Line
	print "ft_inspection~# ".cyan.bold
	opt_usr = STDIN.gets.chomp

	if opt_usr == ""
		system("sh $HOME/.ft_inspection/srcs/.prompt.sh")
		ft_menu()
	elsif opt_usr == "99" || opt_usr == "Exit" || opt_usr == "exit"
		print "\nGoodBye √\n\n".red.bold
		exit
	elsif opt_usr == "0"
		print "\n"
		system("git pull")
		print "\n"
		sleep 2
		system("sh $HOME/.ft_inspection/srcs/.prompt.sh")
		ft_menu()
	elsif opt_usr == "8"
		system("rm -rf $HOME/.ft_inspection/srcs/.env")
		system("sh $HOME/.ft_inspection/ft_inspection.sh")
	else
		print "\nCommand not found\n\n"
		sleep 0.5
		system("clear")
		system("sh $HOME/.ft_inspection/srcs/.prompt.sh")
		ft_menu()
	end

end

ft_menu()
