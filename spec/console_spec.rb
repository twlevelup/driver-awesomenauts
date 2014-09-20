require 'console'

describe Console do

	let(:output) {StringIO.new}
	let(:input) {StringIO.new}
	let(:console) {Console.new(input, output)}

	it 'e2e test 1' do 
		input.puts "4,2,N"
		input.puts "2,2"
		input.puts "q"
		input.rewind

		console.ui 

		output_line = output.string.split("\n")
		expect(output_line[0]).to eql ("Please enter the location of taxi eg:1,1,N")
		expect(output_line[1]).to eql ("Please enter destination")
		expect(output_line[2]).to eql ("Current location of taxi: 2,2,W")
	end

end