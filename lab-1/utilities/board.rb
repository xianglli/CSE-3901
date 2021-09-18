# This class is used as the board of the set game.
# It contains initial of deck, and pop, push cards.
# This class is powered by plizong

require '/utilities/cards.rb'

class Board
  attr_reader :board

  def initialize
    shuffler = [0..80]
    shuffler.shuffle
    shuffler.each { |i|
      @board << Card.new(i)
    }
  end

  def another_card
    @board.shuffle
    @board.pop
  end

  def remain_card
    @board.length
  end

end

