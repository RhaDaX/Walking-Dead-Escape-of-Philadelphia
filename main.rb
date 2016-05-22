require 'gosu'


require_relative 'z_order'
require_relative 'title'
require_relative 'zombie'
require_relative 'player'
require_relative 'bullet'
require_relative 'window'

WindowWidth = 640
WindowHeight = 384

window = Window.new(WindowWidth, WindowHeight)
window.show