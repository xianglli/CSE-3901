# A module for checking if 3 card is a set
# This module is powered by plizong

require './cards.rb'

module Checker
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
end