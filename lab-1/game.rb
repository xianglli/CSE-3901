# Set Game itself.
# 2021/9/19 MVP Just support single player game.
require './config/config.rb'
require './utilities/actionChecker.rb'
require './utilities/board.rb'
require './utilities/game.rb'
require 'gosu'
include Config
include ActionChecker

# determines whether a graphical widget is placed over others or not
module ZOrder
  BACKGROUND, MIDDLE, TOP = *0..2
end

class GameInterface < Gosu::Window
  def initialize(option)
    # DO NOT TRY TO ADD HEIGHT!
    # OR IT WILL RUIN THE XSERVER!
    super G_WINDOWS_WIDTH, G_WINDOWS_HEIGHT
    @info = Gosu::Font.new(25)
    self.caption = "Set Game by Future-Tech Corp"

    @newgame = Game.new(option)
    @images = []
    (0..11).each { |i|
      @newgame.shown_card << @newgame.board.get_card
      if @newgame.shown_card[i]
        @images << Gosu::Image.new(@newgame.shown_card[i].get_card_url)
      end
    }
  end

  def update
    update_image

    if @newgame.selected_card.length == 3
      if checker(@newgame.shown_card[@newgame.selected_card[0]], @newgame.shown_card[@newgame.selected_card[1]], @newgame.shown_card[@newgame.selected_card[2]])
        @newgame.player.score += 1
        @newgame.selected_card.each { |i|
          if @newgame.board.remain_card > 0
            @newgame.shown_card[i] = @newgame.board.get_card
          else
            @newgame.shown_card[i] = nil
          end
        }
        @newgame.selected_card.clear
      else
        (0..2).each { |i|
          @newgame.shown_card[@newgame.selected_card[i]].select_card
        }
        @newgame.selected_card.clear
      end
    end
  end

  def hint
    count = 0
    for i in 0..9
      for j in i+1..10
        for k in j+1..11
          if checker(@newgame.shown_card[i], @newgame.shown_card[j], @newgame.shown_card[k])
            count += 1
          end
        end
      end
    end
    return count
  end

  def draw
    Gosu.draw_rect(0, 0, G_WINDOWS_WIDTH, G_WINDOWS_HEIGHT, BGCOLOR, ZOrder::BACKGROUND, mode = :default)
    @info.draw_text("Your Score: #{@newgame.player.score} sets", 960, 640, 0, scale_x = 1, scale_y = 1, color = 0xffffffff, mode = :default)
    Gosu.draw_rect(100, 635, G_BUTTON_WIDTH, G_BUTTON_HEIGHT, 0xffff006e, ZOrder::BACKGROUND, mode = :default)
    @info.draw_text("Start Game", 125, 645, 0, scale_x = 1, scale_y = 1, color = 0xffeeee00, mode = :default)

    if @newgame.turn != -1
      Gosu.draw_rect(595, 0.5 * LINESPACE - 10, G_BUTTON_WIDTH, G_BUTTON_HEIGHT, 0xffff006e, ZOrder::BACKGROUND, mode = :default)
      @info.draw_text("Possible Sets:" + hint().to_s, 600, 0.5 * LINESPACE, 0, scale_x = 1, scale_y = 1, color = 0xffeeee00, mode = :default)
    end

    #Check for changes in selected images, draw border if card is selected
    (0..11).each { |i|
      if @images[i] and @newgame.shown_card[i]
        position = position_checker(i)
        if @newgame.shown_card[i].selected == 1
          Gosu.draw_rect(position[0] - 5, position[1] - 5, CARD_WIDTH + 10, CARD_HEIGHT + 10, 0xffffee00, z = 0, mode = :default)
        end
        @images[i].draw(position[0], position[1], 0)
      end
    }

    if @newgame.turn != -1
      Gosu.draw_rect(100, 635, G_BUTTON_WIDTH, G_BUTTON_HEIGHT, 0xffe6e6e6, ZOrder::TOP, mode = :default)
      @info.draw_text("Time of this attempt: #{time_format(@newgame.start, Time.now)} s", 100, 0.5 * LINESPACE, 0, scale_x = 1, scale_y = 1, color = 0xffffffff, mode = :default)
    end

  end

  def needs_cursor?
    true
  end

  def button_down(id)
    if Gosu.button_down? Gosu::MS_LEFT
      clickType = check_game_option(mouse_x, mouse_y)

      if clickType.is_a? Integer and @newgame.turn != -1
        switch_select_state(clickType)
      elsif clickType == "begin"
        @newgame.turn = 0
        @newgame.start = Time.now
      end

    else
      super
    end
  end

  def update_image
    (0..11).each { |i|
      if @images[i] and @newgame.shown_card[i]
        @images[i] = Gosu::Image.new(@newgame.shown_card[i].get_card_url)
      end
    }
  end

  def switch_select_state(cardNumber)
    if @newgame.selected_card.length < 3 and @newgame.shown_card[cardNumber].selected == 0
      @newgame.shown_card[cardNumber].select_card
      @newgame.selected_card << cardNumber
    elsif @newgame.shown_card[cardNumber].selected == 1
      @newgame.selected_card.delete(cardNumber)
      @newgame.shown_card[cardNumber].select_card
    end
  end
end

