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
end
