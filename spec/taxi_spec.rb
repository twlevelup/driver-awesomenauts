require 'taxi'

describe Taxi do
	
	describe 'current taxi location' do
    	it "should return the taxi's location" do
    		taxi = Taxi.new 1,1,:W
    		position = taxi.position
    		expect(position).to eql([1,1,:W])
    	end
    end
    
    describe 'move forward' do

    	context "at position 1,1,N" do
    	
    		let(:taxi){ Taxi.new(1,1,:N) }

    	    it 'should be at the start position we create it at' do

    	        # act
    	        location = taxi.position

    	        # assert
    	        expect(location).to eql([1,1,:N])
    	    end

    	    it 'should be at the end position after it moves' do

    	        # act
    	        taxi.move_forward

    	        # assert
    	        expect(taxi.position).to eql([1,2,:N])
    	    end

    	    it 'should be at (1,3,N) after 2 moves' do
    	        # act
    	        taxi.move_forward
    	        taxi.move_forward

    	        # assert
    	        expect(taxi.position).to eql([1,3,:N])
    	    end

    	    it 'should return (1,3,N) after 2 moves' do
    	        #act
    	        taxi.move_forward
    	        returned_position = taxi.move_forward

    	        #assert
    	        expect(returned_position).to eql([1,3,:N])
    	    end
    	end

    	context "at position 1,1,E" do

			let (:taxi) {Taxi.new(1,1,:E)}
    	    

    	    it 'should be at (2,1,E) after one move' do

    	        # act
    	        taxi.move_forward

    	        # assert
    	        expect(taxi.position).to eql([2,1,:E])
    	    end

    	    it 'should be at (3,1,E) after two moves' do

    	        #act
    	        taxi.move_forward
    	        taxi.move_forward

    	        # assert
    	        expect(taxi.position).to eql([3,1,:E])
    	    end
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

    describe "turning left" do
		
		let (:taxi) { Taxi.new(1,1,:W)}
		
        it "when facing north it should face west when it turns left" do
            #arrange
            taxi = Taxi.new 1, 1, :N

            #act
            taxi.turn_left
            position = taxi.position
            facing = position[2]

            #assert
            expect(facing).to eql(:W)
        end

        it "when facing west it should face south when it turns left" do
            #arrange
            taxi = Taxi.new 1, 1, :W
            #act
            taxi.turn_left
            position = taxi.position
            facing = position[2]

            #assert
            expect(facing).to eql(:S)
        end

        it "when facing south it should face east when it turns left" do
            #arrange
            taxi = Taxi.new 1, 1, :S
            #act
            taxi.turn_left
            position = taxi.position
            facing = position[2]

            #assert
            expect(facing).to eql(:E)
        end

        it "when facing east it should face north when it turns left" do
            #arrange
            taxi = Taxi.new 1, 1, :E
            #act
            taxi.turn_left
            position = taxi.position
            facing = position[2]

            #assert
            expect(facing).to eql(:N)
        end
    end
    
    describe "reversing" do
        it "should reverse from north" do
            taxi = Taxi.new 1, 1, :N
            taxi.reverse
            position = taxi.position
            expect(taxi.position).to eql([1,0,:N])
        end
        it "should reverse from south" do
            taxi = Taxi.new 1, 1, :S
            taxi.reverse
            position = taxi.position
            expect(taxi.position).to eql([1,2,:S])
        end 
        it "should reverse from west" do
            taxi = Taxi.new 1, 1, :W
            taxi.reverse
            position = taxi.position
            expect(taxi.position).to eql([2,1,:W])
        end
        it "should reverse from east" do
            taxi = Taxi.new 1, 1, :E
            taxi.reverse
            position = taxi.position
            expect(taxi.position).to eql([0,1,:E])
        end    
	end
	
    describe 'taxi stop' do
    	let (:taxi) {Taxi.new(1,1,:W)} 
    	
    	it 'should return location,orientation and status when taxi stop' do
    		expect(taxi.stop).to eql("Location:1,1,W - Status:Stopped")
    	end
    	
    	it 'should return location,orientation and status when taxi stop after moving forward' do
    		taxi.move_forward
    		expect(taxi.stop).to eql("Location:0,1,W - Status:Stopped")
    	end
    	
    	it 'should return location,orientation and status when taxi stop after turn left' do
    		taxi.turn_left
    		expect(taxi.stop).to eql("Location:1,1,S - Status:Stopped")
    	end
    	
    	it 'should return location,orientation and status when taxi stop after turn right' do
    		taxi.turn_right
    		expect(taxi.stop).to eql("Location:1,1,N - Status:Stopped")
    	end
    end
end
