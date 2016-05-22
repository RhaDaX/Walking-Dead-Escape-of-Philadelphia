class Window < Gosu::Window
  
  def initialize(width, height)
    super
    self.caption = "The Walking Dead : Escape of Philadelphia"     
    @game_in_progress = false
    @player = Player.new
    @zombies = []
    @bullet = []
    @title = Title.new
    title_screen
    @i = 0
  end

  def title_screen
    @background_image = Gosu::Image.new("assets/home-screen.jpg")
  end
  
  def setup_game  
    @background_image = Gosu::Image.new("assets/bg.gif")
    @game_in_progress = true
  end
  
  def button_down(id)
    close if id == Gosu::KbEscape
    @player.already_fire if id == Gosu::KbF
  end
  
  def button_up(id)
    @player.jump_down if id == Gosu::KbUp
    
  end
  
  def update
    if Gosu::button_down?(Gosu::KbSpace)
      setup_game unless @game_in_progress
    end
    return unless @game_in_progress
    update_player
    update_zombie
    update_bullet
  end
  
  def update_player
    if Gosu::button_down?(Gosu::KbF)
        if @bullet == nil
          @player.fire 
          @bullet = Bullet.new(@player)
        end
    end
    @player.go_left if Gosu::button_down?(Gosu::KbLeft)
    @player.go_right if Gosu::button_down?(Gosu::KbRight)
    @player.jump_up if Gosu::button_down?(Gosu::KbUp) && @player.y == false
    @player.jump_down if @player.y == true
    @player.move
  end
  

  
  def update_zombie
    unless @zombies.size > 4
      side = [:left, :right].sample
      r = rand
      @zombies.push(Zombie.new(side)) if r < 0.035     
    end
    @zombies.each(&:update)
    @zombies.reject! {|zombie| zombie.left > WindowWidth || zombie.right < 0 }
  end
  
  def update_bullet
    unless @bullet.size > 1
      
      @bullet.update(@player) if @bullet != nil
  end
  
  def draw
    unless @game_in_progress
      @background_image.draw(0, 0, ZOrder::Background, 0.23, 0.23)
      @title.draw
    end
    return unless @game_in_progress
    @background_image.draw(0, 0, ZOrder::Background)
    @zombies.each(&:draw)
    @player.draw
    @bullet.draw(@player) if @bullet != nil
    @direction = nil
  end
  
  
  
end

