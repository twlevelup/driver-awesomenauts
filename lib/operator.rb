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

	def parse_location
		coordinates = ARGV[0].split(',')
		x = coordinates[0].to_i
		y = coordinates[1].to_i
		facing = coordinates[2].to_sym
		[x, y, facing]
	end

	def parse_commands
		commands = ARGV[1].split("")
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
