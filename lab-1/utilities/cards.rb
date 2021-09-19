# This class is used for create card and chase card info
# This class is powered by Louis Xiang Li (plizong)

class Card
  attr_reader :id, :selected

  # We make following assumption:
  # shape : 0: squiggles, 1:diamond  , 2:oval
  # color : 0: red      , 1:purple   , 2:green
  # number: 0: 1        , 1: 2       , 2:3
  # symbol: 0: solid    , 1: striped , 2:open
  # id of the card is Dec of (xxxx)3
  # xxxx = (symbol, shape, color, number)

  def initialize(id)
    tmp = id
    result = 0
    i = 0

    # decode the id to each field of Card Class
    while tmp / 3 != 0 do
      remainder = tmp / base
      result += remainder * (10 ** i)
      i += 1
      tmp = tmp / 3
    end

    @id = id
    @symbol = result / 1000
    @shape = (result / 100) % 10
    @color = (result / 10) % 10
    @number = result % 10
    @selected = 0
  end

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