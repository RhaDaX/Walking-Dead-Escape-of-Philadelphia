class Bullet
  def initialize(player)
    @y = 322
    @x = player.get_player_x
    @image = Gosu::Image.new("assets/bullet.png")
  end
  
  def update(player)
    @x -= 10 if player.bullet_side == :left
    @x += 10 if player.bullet_side == :right
  end
  
  def draw(player)
    @image.draw( @x -5  , @y , ZOrder::Bullet, -0.3, 0.3) if player.bullet_side == :right
    @image.draw( @x - 45 , @y , ZOrder::Bullet, 0.3, 0.3) if player.bullet_side == :left
  end
end