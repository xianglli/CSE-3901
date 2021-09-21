# This class is some common attribute of a game
# 9.20 note: This is just MVP of the project
# This class is subject to modify
# This class is powered by plizong
require './utilities/board.rb'
require './utilities/player'

class Game
  attr_accessor :option, :board, :player, :shown_card, :selected_card, :timer, :turn, :score

  def initialize(option)
    @option = option   # 9.20/ There is only one mode - single player (MVP)
    @board = Board.new
    @player = Player.new(0, 'Player 0') # 9.20/ MVP of just one player
    @shown_card = []  #Card shown on board. Default 12 cards
    @selected_card = [] #Card selected.
    @timer = nil
    @turn = -1 # This is the support of multi player mode. Number indicate player, -1 stand for no turn
  end
end