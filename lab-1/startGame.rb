require 'gosu'
require './config/config.rb'
require './game.rb'
include Config


class StartPage < Gosu::Window
  def initialize
    super WINDOWS_WIDTH, WINDOWS_HEIGHT
    self.caption = "Set Game by Future-Tech Corp"
    @title = Gosu::Font.new(40)
    @manufactor = Gosu::Font.new(20)
    @welcome_image = Gosu::Image.new('media/welcome.jpg')
    @single = Gosu::Font.new(30)
  end

  def update
    # ...
  end

  def draw
    Gosu.draw_rect(0, 0, WINDOWS_WIDTH, WINDOWS_HEIGHT, BGCOLOR, ZOrder::BACKGROUND, mode = :default)
    @title.draw_text("Set Card Game", WINDOWS_WIDTH / 2 - 130, LINESPACE, 0, scale_x = 1, scale_y = 1, color = 0xffffff00, mode = :default)
    @manufactor.draw_text("by Future-Tech Corp, CSE 3901", WINDOWS_WIDTH / 2 - 130, LINESPACE * 2, 0, scale_x = 1, scale_y = 1, color = 0xff00cfcf, mode = :default)
    @welcome_image.draw(WINDOWS_WIDTH / 2 - WEL_PIC_WIDTH , 3 * LINESPACE)
    Gosu.draw_rect(60, 11 * LINESPACE, WEL_BUTTON_WIDTH, WEL_BUTTON_HEIGHT, WEL_BUTTON_COLOR, ZOrder::BACKGROUND, mode = :default)
    @single.draw_text("Single player", 112, 11 * LINESPACE + 18, 0, scale_x = 1, scale_y = 1, color = 0xffff00ff, mode = :default)
  end

  def needs_cursor?
    true
  end

  def button_down(id)
    case mouse_x
    when (60..WINDOWS_WIDTH - 60)
      case mouse_y
      when (11 * LINESPACE..WINDOWS_HEIGHT)
        if Gosu.button_down? Gosu::MS_LEFT
          option = game_mode_checker(mouse_x, mouse_y)
          if option
            close
            GameInterface.new(option).show
          end
        else
          super
        end
      else
        # do nothing
      end
    else
      # do nothing
    end
  end
end

StartPage.new.show
