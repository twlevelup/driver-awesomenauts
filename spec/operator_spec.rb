require 'operator'
require 'taxi'

describe Operator do
	describe 'Command Handler' do
    	it "should return new position after move forward" do
    		
    		#Arrange
    		taxi = Taxi.new 1,1,:W
    		command = 'F'
    		
    		#Act/When
    		handler = Operator.new
    		handler.command_handler(taxi,command)
    		
    		#Arrange
    		expect(taxi.stop).to eql("0,1,W")
    	end
    	
    	it "should return new position after turn left" do
            
            #Arrange
            taxi = Taxi.new 1,1,:W
            command = 'L'
            
            #Act/When
            handler = Operator.new
            handler.command_handler(taxi,command)
            
            #Arrange
            expect(taxi.stop).to eql("1,1,S")
        end

        it "should return new position after turn right" do
            
            #Arrange
            taxi = Taxi.new 1,1,:W
            command = 'R'
            
            #Act/When
            handler = Operator.new
            handler.command_handler(taxi,command)
            
            #Arrange
            expect(taxi.stop).to eql("1,1,N")
        end

        it "should return new position after move back-forward" do
            
            #Arrange
            taxi = Taxi.new 1,1,:W
            command = 'B'
            
            #Act/When
            handler = Operator.new
            handler.command_handler(taxi,command)
            
            #Arrange
            expect(taxi.stop).to eql("2,1,W")
        end

        it "should return new position after multiple command" do
            
            #Arrange
            taxi = Taxi.new 1,1,:W
            command = 'BRF'
            
            #Act/When
            handler = Operator.new
            handler.command_handler(taxi,command)
            
            #Arrange
            expect(taxi.stop).to eql("2,2,N")
        end
	end

    describe 'parse_location' do
        it "assigns and returns the location parameters entered in the command line" do
            # Arrange
            handler = Operator.new

            # Act  
            taxi = handler.create_taxi '1,2,N'  

            # Assert
            expect(taxi.position).to eql([1,2,:N])
        end
    end

    describe 'validation' do
        it "if x >8 should return false" do
            handler = Operator.new
            expect(handler.coordinate_isvalid(9,0)).to eql(false)
        end

        it "if x <0 should return false" do
            handler = Operator.new
            expect(handler.coordinate_isvalid(-1,0)).to eql(false)
        end

        it "if y >4 should return false" do
            handler = Operator.new
            expect(handler.coordinate_isvalid(0,5)).to eql(false)
        end

        it "if y <0 should return false" do
            handler = Operator.new
            expect(handler.coordinate_isvalid(0,-1)).to eql(false)
        end

        it "if all good should return true" do
            handler = Operator.new
            expect(handler.coordinate_isvalid(2,1)).to eql(true)
        end

    end
end
