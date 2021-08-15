require 'colorize'

def ft_menu

	opt_usr = 0;

	# Menu Options
	print "{1}--| ".blue; puts ""
	print "{2}--| ".blue; puts ""
	print "{3}--| ".blue; puts ""
	print "{4}--| ".blue; puts ""
	print "{5}--| ".blue; puts ""
	print "{6}--| ".blue; puts ""
	print "{7}--| ".blue; puts ""
	print "{8}--| ".blue; puts "Edit API token"
	print "{0}--| ".blue; puts "Install & Update"
	print "{99}-| ".blue; print "Exit\n\n"
	
	# Command Line
	print "ft_inception~# ".blue
	opt_usr = STDIN.gets.chomp

	if opt_usr == ""
		system("sh srcs/.prompt.sh")
		ft_menu()
	elsif opt_usr == "99"
		print "\nGoodBye √\n\n".red
	elsif opt_usr == "0"
		print "\n"
		system("git pull")
		sleep 2
		system("sh srcs/.prompt.sh")
		ft_menu()
	end


end

ft_menu()