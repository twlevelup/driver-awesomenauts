require_relative 'operator'
require_relative 'taxi'
require_relative 'grid'


class Console

	def initialize(input, output)
		@input = input
		@output = output
		@handler = Operator.new
	end

	def handler(taxi, location, destination)
		taxi_location = location
		taxi_destination = destination
		x = taxi_destination[0].to_i
		y = taxi_destination[1].to_i
		@handler.give_destination taxi, x, y
		@handler.progress_all_taxis(taxi)
	end

	def ui
		@output.puts "Please enter the location of taxi eg:1,1,N"
		taxi_location = @input.gets.chomp
		taxi = @handler.create_taxi taxi_location

		loop do
			@output.puts "Please enter destination of taxi:"
			taxi_destination = @input.gets.chomp.split(',')
			handler(taxi, taxi_location, taxi_destination)	
			puts "----- Press any key to continue, Press q to exit ... -----"
			next_line = @input.gets.chomp

			break if (next_line == 'q' || next_line == 'Q')
		end
	end
end

