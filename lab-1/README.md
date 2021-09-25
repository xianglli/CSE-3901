# Set Game by Future-Tech Corp
Set (stylized as SET) is a real-time card game designed by Marsha Falco in 1974 and published by Set Enterprises in 1991. The deck consists of 81 unique cards that vary in four features across three possibilities for each kind of feature: number of shapes (one, two, or three), shape (diamond, squiggle, oval), shading (solid, striped, or open), and color (red, green, or purple).Each possible combination of features (e.g. a card with three striped green diamonds) appears as a card precisely once in the deck.[1]

We want to thank all our past and present community contributors and are really interested in all new potential contributions. For our community no contribution is too small, we encourage all types of contributions.

## How to run?
Set Game is developed and tested on Windows machine and Linux machine, not sure if it works properly in MacOS.
### Run with bundle
```shell
bundle exec ruby startGame.rb
```
### Run with Gem and Ruby
```shell
gem install gosu
ruby startGame.rb
```
Then you will get into the game starter page. Click on buttons to choose the game mode you want to play.

## How to play?
In the game, certain combinations of three cards are said to make up a set. For each one of the four categories of features — color, number, shape, and shading — the three cards must display that feature as a) either all the same, or b) all different. Put another way: For each feature the three cards must avoid having two cards showing one version of the feature and the remaining card showing a different version.

For example, 3 solid red diamonds, 2 solid green squiggles, and 1 solid purple oval form a set, because the shadings of the three cards are all the same, while the numbers, the colors, and the shapes among the three cards are all different.


## Design & Develop
### Code layout
* config/ 

    config folder contains only one file, config.rb. It contains the global variable and system setting information. It can modify the style of GUI.


* utilities/

    utilities was formed with two important part. First is the class of each item in the card game, include game class, card class, player class, board class. The second part is checker functions. Still, checker functions was included in the module actionChecker in actionChecker.rb. It contains checker for cards logic, and for system, most importantly, checkers for buttons.


* media/

    media contains pictures and other media used in GUI game


* media/cards/

    the picture of cards. Cards file name is an integer that decimal number of the picture title represents the code of the card. The specific conversion method can be found in ```./utilities/cards/rb```.


* game.rb

    the actual game of Set game. This include ```gosu``` module.


* startGame.rb
    
    the starter of the game. It contains the selection of game mode.
    

    

    
