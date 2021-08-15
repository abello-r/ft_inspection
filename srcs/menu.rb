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

	if opt_usr == "99"
		print "\nBye √\n\n".red
		exit
	end


end

ft_menu()