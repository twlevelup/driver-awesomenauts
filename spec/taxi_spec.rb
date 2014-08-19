require 'taxi'

describe Taxi do
    
    context "at position 1,1,N" do
        before :each do
            @taxi = Taxi.new(1,1,:N)
        end

        it 'should be at the start position we create it at' do

            # act
            location = @taxi.position

            # assert
            expect(location).to eql([1,1,:N])
        end

        it 'should be at the end position after it moves' do

            # act
            @taxi.move_forward

            # assert
            expect(@taxi.position).to eql([1,2,:N])
        end

        it 'should be at (1,3,N) after 2 moves' do
            # act
            @taxi.move_forward
            @taxi.move_forward

            # assert
            expect(@taxi.position).to eql([1,3,:N])
        end

        it 'should return (1,3,N) after 2 moves' do
            #act
            @taxi.move_forward
            returned_position = @taxi.move_forward

            #assert
            expect(returned_position).to eql([1,3,:N])
        end
    end

    context "at position 1,1,E" do

        before :each do
            @taxi = Taxi.new(1,1,:E)
        end

        it 'should be at (2,1,E) after one move' do

            # act
            @taxi.move_forward

            # assert
            expect(@taxi.position).to eql([2,1,:E])
        end

        it 'should be at (3,1,E) after two moves' do

            #act
            @taxi.move_forward
            @taxi.move_forward

            # assert
            expect(@taxi.position).to eql([3,1,:E])
        end
    end

    describe 'turn right' do
        it 'turn right from West to North' do
            taxi = Taxi.new 1,1,:W
            taxi.turn_right
            facing = taxi.position[2]
            expect(facing).to eq(:N)
        end

        it 'turn right from North to East' do
            taxi = Taxi.new 1,1,:N
            taxi.turn_right
            facing = taxi.position[2]
            expect(facing).to eq(:E)
        end

        it 'turn right from East to South' do
            taxi = Taxi.new 1,1,:E
            taxi.turn_right
            facing = taxi.position[2]
            expect(facing).to eq(:S)
        end

        it 'turn right from South to West' do
            taxi = Taxi.new 1,1,:S
            taxi.turn_right
            facing = taxi.position[2]
            expect(facing).to eq(:W)
        end

        it 'turn right twice from West to East' do
            taxi = Taxi.new 1,1,:W
            taxi.turn_right
            taxi.turn_right
            facing = taxi.position[2]
            expect(facing).to eq(:E)
        end

         it 'turn right should return the new facing' do
            taxi = Taxi.new 1,1,:W
            facing = taxi.turn_right
            expect(facing).to eq(:N)
        end
        
    end
end
