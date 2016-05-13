class Title
  
  def initialize
    @font = Gosu::Font.new( 20, name: "assets/torture.ttf")
  end
  
  def draw
    @font.draw("The Walking Dead - Escape from Philadelphia.", 100, 190, ZOrder::Title, 1.0, 1.0, 0xff_ffffff)
  end
end