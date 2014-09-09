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
	end
end
