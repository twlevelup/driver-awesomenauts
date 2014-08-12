class Taxi
    attr_reader :position

    def initialize(position)
        @position = position
    end

    def move
        y = @position[2].to_i
        x = @position[0].to_i
        orientation = @position[4]

        if orientation == "N"
            @position = "#{x},#{y+1},#{orientation}"
        else orientation == "E"
            @position = "#{x+1},#{y},#{orientation}"
        end
    end
end
