# This module is used for check the actions in the pages
# This module is powered by plizong
require './config/config.rb'
include Config

module ActionChecker

  ###############################################
  #          Game Logic Checkers                #
  ###############################################

  # In the game, we have to choose the
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
      # if  shape_equal or color_equal or number_equal or symbol_equal
      return true
    end
    false
  end

  ###############################################
  #           System Control Checkers           #
  ###############################################

  # Check the mouse click on the welcome page.
  def game_mode_checker(mouse_x, mouse_y)
    if mouse_x > 60 and mouse_x < 60 + WEL_BUTTON_WIDTH and mouse_y > 11 * LINESPACE and mouse_y < 11 * LINESPACE + WEL_BUTTON_HEIGHT
      "single"
    end
  end

  # Check the mouse click on the card position (select a card in game)
  def position_checker(i)
    x = 100
    y = 100
    x += i % 4 * (CARD_WIDTH + 10)
    y += i / 4 * (CARD_HEIGHT + 10)
    [x, y]
  end

  def check_game_option(mouse_x, mouse_y)
    # case cards
    positions = []
    (0..11).each { |i|
      position = position_checker(i)
      if mouse_x > position[0] and mouse_x < position[0] + CARD_WIDTH and mouse_y > position[1] and mouse_y < position[1] + CARD_HEIGHT
        return i
      end
    }

    # case buttons
    if mouse_x > 100 and mouse_x < 100 + G_BUTTON_WIDTH and mouse_y > 635 and mouse_y < 635 + G_BUTTON_HEIGHT
      "begin"
    end
  end
end
