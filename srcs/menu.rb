require "colorize"

def ft_menu

	opt_usr = 0;

	# Menu Options
	print "{1}--| ".cyan; puts ""
	print "{2}--| ".cyan; puts ""
	print "{3}--| ".cyan; puts ""
	print "{4}--| ".cyan; puts ""
	print "{5}--| ".cyan; puts ""
	print "{6}--| ".cyan; puts ""
	print "{7}--| ".cyan; puts "See status token"
	print "{8}--| ".cyan; puts "Edit API token"
	print "{0}--| ".cyan; puts "Update"
	print "{99}-| ".cyan; print "Exit\n\n"
	
	# Command Line
	print "ft_inspection~# ".cyan
	opt_usr = STDIN.gets.chomp

	if opt_usr == ""
		system("sh srcs/.prompt.sh")
		ft_menu()
	elsif opt_usr == "99" || opt_usr == "Exit" || opt_usr == "exit"
		print "\nGoodBye √\n\n".red
		exit
	elsif opt_usr == "0"
		print "\n"
		system("git pull")
		print "\n"
		sleep 2
		system("sh srcs/.prompt.sh")
		ft_menu()
	elsif opt_usr == "8"
		system("rm -rf srcs/.env")
		system("sh ft_inspection.sh")
	else
		print "\nCommand not found\n\n"
		sleep 0.5
		system("clear")
		system("sh srcs/.prompt.sh")
		ft_menu()
	end

end

ft_menu()
