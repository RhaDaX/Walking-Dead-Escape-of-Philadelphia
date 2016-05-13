class Player
  Perso = "assets/Rick.png"
  @direction = nil
  AccelFactor = 0.3
  AccelFactorJump = 2.5
  SkidingFactor = 0.9
  SkidingFactorJump = 0
  @jump = false
  
  def initialize
    @x = 300
    @y = 300
    @ground = 0
    @velocity = 0.0
    @velocity_jump = 0.0
    @image = Gosu::Image.load_tiles( Perso , 64, 64 )
    
             
  end
  
  def draw
    if @direction == "left"
      @image[5].draw(@x, @y, ZOrder::Player)
    elsif @direction == "right"
      @image[9].draw(@x, @y, ZOrder::Player)
    else
      @image[0].draw(@x, @y, ZOrder::Player)
    end
    
  end
  
  def go_left
    @velocity -= AccelFactor if @x > 50 
    @direction = "left"
  end
  
  def go_right
    @velocity += AccelFactor if @x < 530
    @direction = "right"
  end

  def jump_up
    if @y >= 220 
    @velocity_jump += AccelFactorJump
    else
      @jump = true
      jump_down
    end
  end
  
  def jump_down
    @jump = true
    if @y < 300
      @velocity_jump -= AccelFactorJump
    else
      @jump = false
    end
  end
    
  def y
    return @jump
  end
  
  def move
    @y -= @velocity_jump
    @y %= WindowHeight
    @velocity_jump *= SkidingFactorJump
    @x += @velocity 
    @x %= WindowWidth 
    @velocity *= SkidingFactor
  end
end