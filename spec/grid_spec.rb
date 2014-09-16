require 'grid'

describe Grid do

	it 'the min of x in grid should be 0' do
		grid = Grid.new
		expect(grid.x_min).to eql(0)
	end

	it 'the max of x in grid should be 8' do
		grid = Grid.new
		expect(grid.x_max).to eql(8)
	end

	it 'the min of y in grid should be 0' do
		grid = Grid.new
		expect(grid.y_min).to eql(0)
	end

	it 'the max of y in grid should be 4' do
		grid = Grid.new
		expect(grid.y_max).to eql(4)
	end
end
