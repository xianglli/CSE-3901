# Set Game by Future-Tech Corp
Set (stylized as SET) is a real-time card game designed by Marsha Falco in 1974 and published by Set Enterprises in 1991. The deck consists of 81 unique cards that vary in four features across three possibilities for each kind of feature: number of shapes (one, two, or three), shape (diamond, squiggle, oval), shading (solid, striped, or open), and color (red, green, or purple).Each possible combination of features (e.g. a card with three striped green diamonds) appears as a card precisely once in the deck.[1]

We want to thank all our past and present community contributors and are really interested in all new potential contributions. For our community no contribution is too small, we encourage all types of contributions.

## How to run?
Set Game (JavaScript version) is developed and tested on Google chrome, Microsoft Edge and Safari. And we do not support IE.

To run this game, simply drag the index.html into your blowser and enjoy the game. If you do not want to download the code, there is an online version of that game https://plizong.com/set , but usually servral commits behind main. The published code are encoded and encrypted.

## How to play?
In the game, certain combinations of three cards are said to make up a set. For each one of the four categories of features — color, number, shape, and shading — the three cards must display that feature as a) either all the same, or b) all different. Put another way: For each feature the three cards must avoid having two cards showing one version of the feature and the remaining card showing a different version.

For example, 3 solid red diamonds, 2 solid green squiggles, and 1 solid purple oval form a set, because the shadings of the three cards are all the same, while the numbers, the colors, and the shapes among the three cards are all different.


## Design & Develop
### Code layout
* asserts/

    JavaScript code for the game. Including listeners and useful functions.


* media/

    media contains pictures and other media used in GUI game


* media/cards/

    the picture of cards. Cards file name is an integer that decimal number of the picture title represents the code of the card. The specific conversion method can be found in ```./assert/shuffler.js```.


* index.html
    
    the game page itself.
    

### Contribute your code
At the current time we just allow people from CSE 3901 group 1 creating pull request, and we are very willingly eager to receive contributions from anybody in the near future. Everyone, including Future-Tech Corp. (FTCo) members are expected to follow the guidence of how to contribute.

#### Coding guidence
Your chances of getting feedback and seeing your code merged into the project greatly depend on how granular your changes are. The style of coding is based on Jetbrains code format.

We recommend using ```git diff --color``` when reviewing your changes so that you don't have any spurious whitespace issues in the code that you submit.

#### Patch submissing
Once you are ready to share your work with the us, you should push all the commits to a new branch begins with ```yourName_``` and send us a pull request.

We welcome submissions which are work in-progress in order to get feedback early in the development process. When opening the pull request, select "Draft" in the dropdown menu when creating the PR to clearly mark the intent of the pull request. Prefixing the title with "WIP:" is also good practice.
    
[1] from http://en.wikipedia.org/wiki/Set_(game)
