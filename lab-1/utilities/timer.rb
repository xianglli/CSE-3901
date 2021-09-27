# This is the class for timer in the game
# This class is powered by Shiying Chen

class Timer
t = Time.new(0)
time = 120 # the timer is set to 120 seconds

time.downto(0) do |seconds|
  puts (t + seconds).strftime('%S')
  sleep 1
end

end

#attr_accessor :mode, :time

  #def initialize
   # @mode = 0 # 0 is counter up, 1 is counting down
    #@time = 0 # 0 stands for time out in counting down, and the initial value of counting up
  #end
