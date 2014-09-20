require 'console'

describe Console do

	let(:output) {StringIO.new}
	let(:input) {StringIO.new}
	let(:console) {Console.new(input, output)}

	it 'e2e test 1' do 
		input.puts "1,1,N"
		input.puts "1,2"
		input.puts "q"
		input.rewind

		console.ui 

		output_line = output.string.split("\n")
		expect(output_line[0]).to eql ("Please enter the location of taxi eg:1,1,N")
		expect(output_line[1]).to eql ("Please enter destination of taxi:")
		expect(output_line[2]).to eql ("Path of the taxi: [[1, 1, :N], [1, 2, :N]]")
		expect(output_line[3]).to eql ("Current location of taxi: 1,2,N")
	end

	it 'validates input for location' do
		input.puts "1,1N"		# Invalid location
		input.puts "1,23456"	# Invalid location
		input.puts "1,1,N"		# Valid location
		input.puts "1,2"		# Input destination
		input.puts "q"			# Quit
		input.rewind

		console.ui 

		output_line = output.string.split("\n")
		expect(output_line[0]).to eql ("Please enter the location of taxi eg:1,1,N")
		expect(output_line[1]).to eql ("Please enter the location of taxi eg:1,1,N")
		expect(output_line[2]).to eql ("Please enter the location of taxi eg:1,1,N")
		expect(output_line[3]).to eql ("Please enter destination of taxi:")
		expect(output_line[4]).to eql ("Path of the taxi: [[1, 1, :N], [1, 2, :N]]")
		expect(output_line[5]).to eql ("Current location of taxi: 1,2,N")
	end

end