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

		taxi_location = get_location

		taxi = @handler.create_taxi taxi_location

		loop do
			@output.puts "Please enter destination of taxi:"
			taxi_destination = @input.gets.chomp.split(',')
			positions = handler(taxi, taxi_location, taxi_destination)
			@output.puts "Path of the taxi: #{positions}"
			@output.puts "Current location of taxi: #{taxi.stop}"
			@output.puts "----Press q to exit----"
			next_line = @input.gets.chomp


			break if (next_line == 'q' || next_line == 'Q')
		end
	end

	def get_location
		taxi_location = ''
		while taxi_location.split(',').length != 3 do
			@output.puts "Please enter the location of taxi eg:1,1,N"
			taxi_location = @input.gets.chomp
		end
		taxi_location	
	end
end

