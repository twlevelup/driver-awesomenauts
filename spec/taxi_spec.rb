require 'taxi'

describe Taxi do

    # Constructor

    context "it does not create an object when passed invalid params" do

        it "when passed Foo as the orientation" do
        end

        it "when passed a negative int as a x value" do
        end

        it "when passed a negative int as a y value" do
        end

    end



    context "at position 1,1,N" do

        let(:start_position) {"1,1,N"}
        let(:taxi) {Taxi.new(start_position)}


        it 'should be at the start position we create it at' do

            # act
            taxi_location = taxi.position

            # assert
            expect(taxi_location).to eql(start_position)
        end

        it 'should be at the end position after it moves' do

            # act
            taxi.move

            # assert
            expect(taxi.position).to eql("1,2,N")
        end

        it 'should be at (1,3,N) after 2 moves' do
            # act
            taxi.move
            taxi.move

            # assert
            expect(taxi.position).to eql("1,3,N")
        end

    end

    context "at position 1,1,E" do

        let(:start_position) {"1,1,E"}
        let(:taxi) {Taxi.new(start_position)}

        it 'should be at (2,1,E) after one move' do

            # act
            taxi.move

            # assert
            expect(taxi.position).to eql("2,1,E")
        end

        it 'should be at (3,1,E) after two moves' do

            #act
            taxi.move
            taxi.move

            # assert
            expect(taxi.position).to eql("3,1,E")
        end
    end
end
