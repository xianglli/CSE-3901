const startGameButton = document.getElementsByClassName('StartGameButton')[0];
const stopGameButton = document.getElementsByClassName('StopGameButton')[0];
let gameState = -1;
let score = 0;

startGameButton.addEventListener("click", function () {
    score = 0;
    gameState = 1;
    gameAlert.innerHTML = "";
    startGameButton.style.backgroundColor = "rgb(108,108,108)";
    startGameButton.innerHTML = "<p style='color: white'>Started</p>";
    scoreCard.innerHTML = "Your current score: " + score;
    stopGameButton.style.backgroundColor = "darkcyan";
    stopGameButton.innerHTML = "<p>Stop Game</p>";
});

stopGameButton.addEventListener("click", function () {
    gameState = -1;
    gameAlert.innerHTML = "";
    stopGameButton.style.backgroundColor = "rgb(108,108,108)";
    stopGameButton.innerHTML = "<p style='color: white'>Stopped</p>";
    scoreCard.innerHTML = "Your final score: " + score;
    startGameButton.style.backgroundColor = "goldenrod";
    startGameButton.innerHTML = "<p style='color: white'>Start Game</p>";
});
