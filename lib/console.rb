require 'operator'
require 'taxi'
require 'grid'

class Console

handler = Operator.new
loop do
	menu
	# Get location

	# Create taxi at location

	# Get destination

	# Send to destination
	handler.progress_all_taxis(taxi)


	break if (input == 'Q' || input == 'q')

require_relative 'operator'

def menu
	puts "Please enter the lacation of taxi eg:1,1,N"
	taxi_location=gets.chomp
	handler=Operator.new
	handler.create_taxi taxi_location
end

end