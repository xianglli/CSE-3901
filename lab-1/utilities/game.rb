# This class is some common attribute of a game
# 9.20 note: This is just MVP of the project
# This class is subject to modify
require './utilities/board.rb'
require './utilities/player'

class Game
  attr_accessor :option, :board, :player, :shown_card, :selected_card, :timer, :turn, :score

  def initialize(option)
    @option = option   # choose the number of players
    @board = Board.new
    @player = Player.new(0, 'Player 0') # player id and username
    @shown_card = []  # initially there are 12 cards on board, 4 columns and 3 rows
    @selected_card = [] #Card selected.
    @timer = nil # racing against the clock
    @turn = -1 # This is the support of multi player mode. Number indicate player, -1 stand for no turn
  end
end