require './utilities/cards.rb'

module Config
  # Background Color
  BGCOLOR = 0xff002200

  # welcome page picture size
  WEL_PIC_HEIGHT = 320
  WEL_PIC_WIDTH = 240

  # welcome page button size and color
  WEL_BUTTON_HEIGHT = 64
  WEL_BUTTON_WIDTH = 256
  WEL_BUTTON_COLOR = 0xffffcc00

  # in-game button size
  G_BUTTON_HEIGHT = 48
  G_BUTTON_WIDTH = 168

  # parameter of line height
  LINESPACE = 50

  # parameter of card size
  CARD_HEIGHT = 167
  CARD_WIDTH = 258

  # parameter of Welcome Windows size
  WINDOWS_HEIGHT = 768
  WINDOWS_WIDTH = 1024

  #parameter of Game Windows size (it may throw an exception the playing window height > 700)
  G_WINDOWS_HEIGHT = 700
  G_WINDOWS_WIDTH = 1280

end
