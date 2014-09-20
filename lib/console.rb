require_relative 'operator'
require_relative 'taxi'
require_relative 'grid'


class Console


	def initialize(input, output)
		@input = input
		@output = output
	end

def menu
	@output.puts "Please enter the location of taxi eg:1,1,N"
	taxi_location = @input.gets.chomp
	handler = Operator.new
	handler.create_taxi taxi_location
end

# handler = Operator.new
# loop do
# 	menu
# 	# Get location

# 	# Create taxi at location

# 	# Get destination

# 	# Send to destination
# 	handler.progress_all_taxis(taxi)


# 	break if (input == 'Q' || input == 'q')
# end

end

