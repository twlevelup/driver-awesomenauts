class Taxi

    def initialize(x,y,facing)
        @x, @y, @facing = x, y, facing
    end

    def move_forward
        if @facing == :N
            @y += 1
        elsif @facing == :E
            @x += 1
        elsif @facing == :S
            @y -= 1
        elsif @facing == :W
            @x -= 1
        end
        [@x, @y, @facing]
    end

    def position
        [@x,@y,@facing]
    end
end
