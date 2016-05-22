class Zombie
  Z = "assets/ZombieSprite.png"
  attr_reader :left, :right
  
  def initialize(side)
    @side = side
    @left = 0
    @right = 640
    @y = 305
    @type = [24, 27, 30, 33, 74, 77, 80, 83].sample
    @image = Gosu::Image.load_tiles( Z , 32, 32 )
    @velocity = Gosu::random(0.4, 1.3)
  end
  
  def update
    @left += @velocity if @side == :right
    @right -= @velocity if @side == :left
  end
  
  def draw
    @image[@type].draw( @left, @y, ZOrder::Zombie, 1.6, 1.6) if @side == :right
    @image[@type].draw( @right , @y, ZOrder::Zombie, -1.6, 1.6) if @side == :left
    
  end
  
end