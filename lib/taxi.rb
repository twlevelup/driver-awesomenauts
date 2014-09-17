class Taxi
    @@orientations = [:N, :W, :S, :E]
    
    def initialize(x,y,facing)
        @x, @y, @facing = x, y, facing
        @destination_x, @destination_y = x,y
    end

    def set_destination(x, y)
      @destination_x, @destination_y = x, y
    end

    def get_destination
      [@destination_x,@destination_y]
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

    def face_x
      if @x < @destination_x
        rotate(:E)
      elsif @x > @destination_x
        rotate(:W)
      end
    end

    def face_y
      if @y < @destination_y
        rotate(:N)
      elsif @y > @destination_y
        rotate(:S)
      end
    end

    def rotate(direction)
      while @facing != direction
        turn_right
      end
    end
	
	def stop
		position.join(',')
	end

end
