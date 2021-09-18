require 'gosu'
require './config/config.rb'
include Config

class StartPage < Gosu::Window
  def initialize
    super WINDOWS_WIDTH, WINDOWS_HEIGHT
    self.caption = "Set Game"
  end

  def update
    # ...
  end

  def draw
    # ...
  end
end

StartPage.new.show
