# This is the class for timer in the game
# This class is powered by Shiying Chen

class Timer
  attr_accessor :mode, :time

  def initialize
    @mode = 0 # 0 is counter up, 1 is counting down
    @time = 0 # 0 stands for time out in counting down, and the initial value of counting up
  end
end
