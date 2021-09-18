require 'gosu'

class Tutorial < Gosu::Window
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

Tutorial.new.show
