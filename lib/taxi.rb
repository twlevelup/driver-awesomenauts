class Taxi
    attr_reader :position

    def initialize(position)
        @position = position
    end

    def move
        y = @position[2].to_i
        x = @position[0].to_i
        facing = @position[4]

        if facing == "N"
            @position = "#{x},#{y+1},#{facing}"
        else facing == "E"
            @position = "#{x+1},#{y},#{facing}"
        end
    end
end
