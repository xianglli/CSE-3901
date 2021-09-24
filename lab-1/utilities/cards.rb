# This class stores the card information
# This class is powered by plizong

class Card
  attr_reader :id, :selected, :symbol, :shape, :color, :number

  # Each card can be expressed as a 4-digit number: xxxx,
  # where each digit means symbol, shape, color, and number from left to right
  # symbol: 0: solid    , 1: striped , 2:hollow
  # shape : 0: squiggles, 1:diamond  , 2:oval
  # color : 0: red      , 1:purple   , 2:green
  # number: 0: 1        , 1: 2       , 2:3

  # the id of the card can be converted to a 4-digit number, then we can know the features of the card
  # id starts from 0 to 80 inclusively
  def initialize(id)
    tmp = id
    result = 0
    i = 0

    # decode the id to each field of Card Class
    while tmp / 3 != 0 do
      remainder = tmp % 3
      result += remainder * (10 ** i)
      i += 1
      tmp = tmp / 3
    end

    # result is the 4-digit number which represents the card
    result += tmp * (10 ** i)

    # instance variables which represent the features of the card
    @id = id
    @symbol = result / 1000
    @shape = (result / 100) % 10
    @color = (result / 10) % 10
    @number = result % 10
    @selected = 0
  end

  # Note that id+1 is the name (or order) of the picture which contains the card
  def get_card_url
    "media/cards/" + (@id + 1).to_s + ".png"
  end

  def select_card
    if @selected == 0
      @selected = 1
    elsif @selected == 1
      @selected = 0
    else
      raise("System error")
    end
  end
end