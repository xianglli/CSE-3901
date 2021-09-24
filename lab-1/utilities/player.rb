# This class stores the player information
# powered by plizong

class Player
  attr_accessor :id, :username, :score

  def initialize(id, username)
    @id = id
    @username = username
    @score = 0
  end
end
