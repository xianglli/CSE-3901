# This class is used for the board of the game
# This class is powered by plizong

require './utilities/cards.rb'

class Board
  attr_accessor :board

  def initialize
    shuffler = []
    @board = []

    (0..80).each { |i|
      @board << Card.new(i)
    }

    @board.shuffle!
  end

  # remove the last element in board
  def get_card
    return @board.pop
  end

  # return a card to the board
  def put_card(new_card)
    @board.push(new_card)
    @board.shuffle!
  end

  # total number of the remaining cards
  def remain_card
    @board.length
  end

end
