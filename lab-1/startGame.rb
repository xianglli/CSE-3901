require 'gosu'

class StartPage < Gosu::Window
  def initialize
    super 1920, 1080
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
