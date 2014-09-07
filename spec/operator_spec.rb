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
end
