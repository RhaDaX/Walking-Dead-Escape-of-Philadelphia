class Window < Gosu::Window
  
  def initialize(width, height)
    super
    self.caption = "The Walking Dead : Escape of Philadelphia"     
    @game_in_progress = false
    @player = Player.new
    @zombie = Zombie.new(:zombie_up)
    @title = Title.new
    title_screen
  end

  def title_screen
    @background_image = Gosu::Image.new("assets/home-screen.jpg")
    
  end
  
  def setup_game  
    @background_image = Gosu::Image.new("assets/bg.gif")
    @game_in_progress = true
  end
  
  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
  
  def button_up(id)
    @player.jump_down if id == Gosu::KbUp
    
  end
  
  def update
    
    @player.go_left if Gosu::button_down?(Gosu::KbLeft)
    @player.go_right if Gosu::button_down?(Gosu::KbRight)
    @player.jump_up if Gosu::button_down?(Gosu::KbUp) && @player.y == false
    @player.jump_down if @player.y == true
    if Gosu::button_down?(Gosu::KbSpace)
      setup_game unless @game_in_progress
    end
    return unless @game_in_progress
    @player.move
  end
  
  def draw
    unless @game_in_progress
      @background_image.draw(0, 0, ZOrder::Background, 0.23, 0.23)
      @title.draw
    end
    return unless @game_in_progress
    @background_image.draw(0, 0, ZOrder::Background)
    @zombie.draw
    @player.draw
    @direction = nil
  end
end

