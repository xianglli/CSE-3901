require 'gosu'
require './config/config.rb'
include Config

# determines whether a graphical widget is placed over others or not
module ZOrder
  BACKGROUND, MIDDLE, TOP = *0..2
end

class StartPage < Gosu::Window
  def initialize
    super WINDOWS_WIDTH, WINDOWS_HEIGHT
    self.caption = "Set Game by Future-Tech Corp"
    @title = Gosu::Font.new(40)
    @manufactor = Gosu::Font.new(20)
    @welcome_image = Gosu::Image.new('media/welcome.jpg')
    #@single= Gosu::Image.new("media/button/single_player.png")
  end

  def update
    # ...
  end

  def draw
    Gosu.draw_rect(0, 0, WINDOWS_WIDTH, WINDOWS_HEIGHT, BGCOLOR, ZOrder::BACKGROUND, mode = :default)
    @title.draw_text("Set Card Game", WINDOWS_WIDTH / 2 - 130, LINESPACE, 0, scale_x = 1, scale_y = 1, color = 0xffffff00, mode = :default)
    @manufactor.draw_text("by Future-Tech Corp, CSE 3901", WINDOWS_WIDTH / 2 - 130, LINESPACE * 2, 0, scale_x = 1, scale_y = 1, color = 0xff00cfcf, mode = :default)
    @welcome_image.draw(WINDOWS_WIDTH / 2 - WEL_PIC_WIDTH / 2, WINDOWS_HEIGHT / 2 - WEL_PIC_HEIGHT / 2)
  end
end

StartPage.new.show
