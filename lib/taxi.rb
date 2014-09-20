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
      else
        []
      end
    end

    def face_y
      if @y < @destination_y
        rotate(:N)
      elsif @y > @destination_y
        rotate(:S)
      else
        []
      end
    end

    def rotate(direction)
      positions = []
      if @facing == :N and direction == :E
        turn_right
        positions.push(position)
      elsif @facing == :E and direction == :N
        turn_left
        positions.push(position)
      elsif @facing == :N and direction == :W
        turn_left
        positions.push(position)
      elsif @facing == :W and direction == :N
        turn_right
        positions.push(position)
      elsif @facing == :W and direction == :S
        turn_left
        positions.push(position)
      elsif @facing == :S and direction == :W
        turn_right
        positions.push(position)
      elsif @facing == :E and direction == :S
        turn_right
        positions.push(position)
      elsif @facing == :S and direction == :E
        turn_left
        positions.push(position)
      else
        while @facing != direction
          turn_right
          positions.push(position)
        end
      end
      positions
    end
	
	def stop
		position.join(',')
	end

end
