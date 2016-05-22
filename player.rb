class Player
  attr_reader :x, :pad, :bullet, :bullet_side, :has_fire
  Perso = "assets/Trevor-sprite.png"
  Fire = "assets/fire.wav"
  @pad = :right
  @side = :right
  @action = nil
  AccelFactor = 0.3
  AccelFactorJump = 3
  SkidingFactor = 0.9
  SkidingFactorJump = 0
  @jump = false
  @has_fire = false
  
  def initialize
    @x = 300
    @y = 300
    @ground = 0
    @velocity = 0.0
    @velocity_jump = 0.0
    @image = Gosu::Image.load_tiles( Perso , 36, 45 )
    @fire_sound = Gosu::Sample.new("assets/fire.wav")
  end
  
  def fire
    if @has_fire == false
      @fire_sound.play(1.0)
      already_fire
    end
    @pad = :fire
    @bullet_side = @side
    @img = @image[5]
  end
  
  def already_fire
    if @has_fire == false
      @has_fire = true
    else
      @has_fire = false
    end
  end
  
  
  
  def draw
    case @pad
    when :left
      @image[0].draw( @x, @y, ZOrder::Player, -1.3, 1.3)
    when :right
      delta = @image[0].width / 2
      @image[0].draw(@x - delta , @y, ZOrder::Player, 1.3, 1.3)
    when :fire
      if @side == :left
        @img.draw( @x - 18, @y, ZOrder::Player, -1.3, 1.3) 
      end
      @img.draw( @x - 36, @y, ZOrder::Player, 1.3, 1.3) if @side == :right
    else
      @image[0].draw( @x, @y, ZOrder::Player, -1.3, 1.3)
    end
    
  end
  
  def go_left
    @pad = :left
    @side = :left
    @velocity -= AccelFactor if @x > 70 
  end
  
  def go_right
    @pad = :right
    @side = :right
    @velocity += AccelFactor if @x < 600
    
  end

  def jump_up
    if @y >= 220 
    @velocity_jump += 1 + AccelFactorJump
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
  
  def get_player_x
    return @x
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