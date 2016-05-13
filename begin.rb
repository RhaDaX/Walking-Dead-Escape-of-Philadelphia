class Begin
  def initialize
    @background_image = Gosu::Image.new("assets/home-screen.jpg")
  end
  
  def button_down(id)
    if id == Gosu::KbEnter
      close
    end
  end
  
  def draw
    @background_image.draw(0, 0, 1)
  end
end