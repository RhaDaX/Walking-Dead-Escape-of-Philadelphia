class Bullet
  attr_reader :x, :has_killed
  DistanceOfCollision = 20
  def initialize(player)
    @has_killed = false
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
  
  def kill(zombies)
    zombies.reject! { |zombie| collide?(zombie) ? collision : false }
  end
  
  private
  
  def collide?(zombie)
      distance = Gosu::distance( @x , @y, zombie.position_x, zombie.y) if zombie.side == :left
      distance = Gosu::distance( @x , @y, zombie.position_x + 45, zombie.y) if zombie.side == :right
      
      distance < DistanceOfCollision

  end
  
  def collision
    true
    @has_killed = true
  end
end