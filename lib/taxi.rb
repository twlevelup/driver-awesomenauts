class Taxi
    def initialize(x,y,facing)
        @x = x
        @y = y
        @facing = facing
    end

    def move_forward

        if @facing == "N"
            @y += 1
        elsif @facing == "E"
            @x += 1
        elsif @facing == "S"
            @y -= 1
        elsif @facing == "W"
            @x -= 1
        end
    end

    def position?
        [@x,@y,@orientation]
    end
end
