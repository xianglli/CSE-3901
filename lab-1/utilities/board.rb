# This class is used for the board of the game
# This class is powered by plizong

require './utilities/cards.rb'

class Board
  attr_accessor :board

  def initialize
    shuffler = []
    @board = []
    # shuffler is the array which stores all the id
    (0..80).each { |i|
      shuffler[i] = i
    }
    # all the ids are randomly distributed in the array
    shuffler = shuffler.shuffle
    shuffler.each { |i|
      # create the new instance of Card class for each card and add to board
      @board << Card.new(i)
    }
  end

  # remove the last element in board
  def get_card
    return @board.pop
  end

  # total number of the remaining cards
  def remain_card
    @board.length
  end

end
