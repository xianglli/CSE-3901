# This class is used as the board of the set game.
# It contains initial of deck, and pop, push cards.
# This class is powered by plizong

require './utilities/cards.rb'

class Board
  attr_accessor :board

  def initialize
    shuffler = []
    @board = []
    (0..80).each { |i|
      shuffler[i] = i
    }
    shuffler = shuffler.shuffle
    shuffler.each { |i|
      @board << Card.new(i)
    }
  end

  def get_card
    return @board.pop
  end

  def remain_card
    @board.length
  end

end

