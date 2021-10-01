const TOTAL_TIME = 600;

const timer = document.getElementsByClassName('timer')[0];

window.onload = function () {
    let totalTime = TOTAL_TIME;
    startGameButton.onclick = function () {
        const id = setInterval(frame, 1000);

        function frame() {
            if (totalTime <= 0) {
                clearInterval(id);
                gameAlert.innerHTML = "<div style='background-color: rgba(147,218,112,0.35); border: 1px solid #28dc14; color: #28dc14'>Time out. Game ended.</div>";
                timer.innerHTML = "";
                totalTime = TOTAL_TIME;
                gameState = -1;
                stopGameButton.style.backgroundColor = "rgb(108,108,108)";
                stopGameButton.innerHTML = "<p style='color: white'>Stopped</p>";
                scoreCard.innerHTML = "Your final score: " + score;
                startGameButton.style.backgroundColor = "goldenrod";
                startGameButton.innerHTML = "<p style='color: white'>Start Game</p>";

            } else if (gameState === -1) {
                clearInterval(id);
                timer.innerHTML = "";
                totalTime = TOTAL_TIME;
            } else {
                totalTime--;
                timer.innerHTML = "Time remaining: " + totalTime + "s";
            }
        }
    }
}