class Taxi
    attr_reader :facing

    def initialize(x,y,facing)
        @x = x
        @y = y
        @facing = facing
    end

    def move_forward

        if @facing == :N
            @y = @y + 1
        elsif @facing == :E
            @x += 1
        elsif @facing == :S
            @y -= 1
        elsif @facing == :W
            @x -= 1
        end
    end

    def position?
        [@x,@y,@facing]
    end
end
