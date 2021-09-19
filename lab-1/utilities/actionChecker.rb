# This module is used for check the actions in the pages
# This module is powered by plizong
require './config/config.rb'
include Config

module ActionChecker

  ###############################################
  #          Game Logic Checkers                #
  ###############################################

  # This checker is check if three card can be a set
  def checker(card1, card2, card3)
    shape_equal = (card1.shape == card2.shape && card2.shape == card3.shape)
    shape_diff = (card1.shape != card2.shape and card1.shape != card3.shape and card2.shape != card3.shape)
    color_equal = (card1.color == card2.color && card2.color == card3.color)
    color_diff = (card1.color != card2.color and card1.color != card3.color and card2.color != card3.color)
    number_equal = (card1.number == card2.number && card2.number == card3.number)
    number_diff = (card1.number != card2.number and card1.number != card3.number and card2.number != card3.number)
    symbol_equal = (card1.symbol == card2.symbol && card2.symbol == card3.symbol)
    symbol_diff = (card1.symbol != card2.symbol and card1.symbol != card3.symbol and card2.symbol != card3.symbol)

    if (shape_diff or shape_equal) and (color_diff or color_equal) and (number_diff or number_equal) and (symbol_diff or symbol_equal)
      return false
    end
    true
  end

  ###############################################
  #           System Control Checkers           #
  ###############################################
  def game_mode_checker(mouse_x, mouse_y)
    if mouse_x > 60 and mouse_x < 60 + WEL_BUTTON_WIDTH and mouse_y > 11 * LINESPACE and mouse_y < 11 * LINESPACE + WEL_BUTTON_HEIGHT
      "single"
    end
  end
end
