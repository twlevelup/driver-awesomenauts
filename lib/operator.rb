class Operator
	
	def command_handler(taxi,command)

		i=0;
		begin
			case command[i]
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
end
