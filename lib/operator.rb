require_relative 'taxi'

class Operator

	#def initialize
	#	location = parse_location
	#	commands = parse_commands
	#	
	#	@x = location[0]
	#	@y = location[1]
	#	@facing = location[2]
	#
	#	@taxi = Taxi.new @x, @y, @facing
	#	command_handler(@taxi, commands)
	#end

	def command_handler(taxi,command_string)

		command_string.each_char {|c| excecute_command(taxi, c)}
		
		return taxi.stop
	end

	def create_taxi(location)
		coordinates = location.split(',')
		x = coordinates[0].to_i
		y = coordinates[1].to_i
		facing = coordinates[2].to_sym
		Taxi.new x, y, facing
	end

	def print_results(location)
		puts "Taxi started at: [#{@x}, #{@y}, :#{@facing}]"
		puts "It's now at: #{@taxi.position}!"
	end


	def coordinate_isvalid(x,y)
		grid = Grid.new
		(x>=grid.x_min && x<=grid.x_max && y>=grid.y_min && y<=grid.y_max)
	end


	def give_destination(taxi,x,y)
		taxi.set_destination(x,y)
	end

	def progress_all_taxis(taxi)
		destination_x = taxi.get_destination[0].to_i
		destination_y = taxi.get_destination[1].to_i

		taxi.face_x

		while taxi.position[0].to_i != destination_x
			taxi.move_forward
			puts "Taxi position: #{taxi.position}"
		end

		taxi.face_y
		while taxi.position[1].to_i != destination_y
			taxi.move_forward
			puts "Taxi position: #{taxi.position}"
		end
		puts "At destination"
	end	


	private

	def excecute_command(taxi,command)
		case command
			when 'F'
				taxi.move_forward
			when 'L'
				taxi.turn_left
			when 'R'
				taxi.turn_right
			when 'B'
				taxi.reverse
			end
	end

	
end

