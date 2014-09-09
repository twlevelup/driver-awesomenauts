class Operator
	
	def command_handler(taxi,command_string)

		command_string.each_char {|c| excecute_command(taxi, c)}
		
		return taxi.stop
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
			i = i + 1 
		end while i <= command.length
		
	end

	def parse_location
		coordinates = ARGV[0].split(',')
		x = coordinates[0].to_i
		y = coordinates[1].to_i
		facing = coordinates[2].to_sym
		[x, y, facing]
	end
end
