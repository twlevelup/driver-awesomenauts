class Taxi
    @@orientations = [:N, :W, :S, :E]
    
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

    def turn_left
      len = @@orientations.length
      orientation_index = @@orientations.index(@facing)
      @facing = @@orientations[(orientation_index + 1) % len]
    end

    def turn_right
        len = @@orientations.length
        orientation_index = @@orientations.index(@facing)
        @facing = @@orientations[(orientation_index - 1) % len]
    end

    def position
        [@x,@y,@facing]
    end

    def reverse
      if @facing == :N
        @y -= 1     
      elsif @facing == :S 
        @y += 1
      elsif @facing == :W
        @x += 1
      elsif @facing == :E
        @x -= 1 
      end
      position
    end

	
	def stop
		"Location:"+ position.join(",") + " - " + "Status:Stopped"
	end

end
