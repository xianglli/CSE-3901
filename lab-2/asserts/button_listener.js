const startGameButton = document.getElementsByClassName('StartGameButton')[0];
let gameState = -1;
let score = 0;

startGameButton.addEventListener("click",function () {
    gameState = 1;
    startGameButton.style.backgroundColor = "rgb(108,108,108)";
    startGameButton.innerHTML="<p style='color: white'>Started</p>";
    scoreCard.innerHTML= "Your current score: " + score;
});