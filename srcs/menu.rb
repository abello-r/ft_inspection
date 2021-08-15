require "colorize"

def ft_menu

	opt_usr = 0;

	# Menu Options
	print "{1}--| ".blue; puts ""
	print "{2}--| ".blue; puts ""
	print "{3}--| ".blue; puts ""
	print "{4}--| ".blue; puts ""
	print "{5}--| ".blue; puts ""
	print "{6}--| ".blue; puts ""
	print "{7}--| ".blue; puts "See status token"
	print "{8}--| ".blue; puts "Edit API token"
	print "{0}--| ".blue; puts "Install & Update"
	print "{99}-| ".blue; print "Exit\n\n"
	
	# Command Line
	print "ft_inspection~# ".blue
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
		system("rm -rf .env")
		system("sh ft_inspection.sh")
	else
		print "\nCommand not found\n\n"
		sleep 0.5
		system("sh ft_inspection.sh")
		system("clear")
		ft_menu()
	end

end

ft_menu()
