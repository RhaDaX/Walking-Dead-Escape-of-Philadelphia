class Zombie
  Zombie = "assets/ZombieSprite.png"
  attr_reader :y
  
  def initialize(type)
    @y = 305
    type = Gosu::random(0, 80)
    @type = type
    @image = Gosu::Image.load_tiles( Zombie , 32, 32 )
  end

  def draw
    @image[@type].draw( 90, @y, ZOrder::Zombie, 1.6, 1.6)
  end
  
end