// Deck listener file is for control cards
const boardCard = document.getElementsByClassName('card');
const gameAlert = document.getElementsByClassName('boardMessage')[0];
const scoreCard = document.getElementsByClassName('scoreBoard')[0];

function changeSelectStatus(card) {
    if (gameState !== -1) {
        card.selected = !card.selected;
        if (card.selected) {
            card.style.backgroundColor = "#ffff00";
        } else {
            card.style.backgroundColor = "#e6e6e6";
        }
    }
}

function calculateScore() {
    score++;
    scoreCard.innerHTML = "Your current score: " + score;
}

function checkSelectCards() {
    let selectedCard = [];
    for (let j = 0; j < 12; j++) {
        if (boardCard[j].selected) {
            selectedCard.push(j);
        }
    }
    if (selectedCard.length > 3) {
        // This should be unreachable, but just put here for safety.
        console.log("Error: only 3 cards expected");
    } else if (selectedCard.length === 3) {
        if (cardChecker(boardCard[selectedCard[0]].label, boardCard[selectedCard[1]].label, boardCard[selectedCard[2]].label)) {
            calculateScore();
            for (let k = 0; k < 3; k++) {
                container.replaceChild(createRandomCard(), boardCard[selectedCard[k]]);
                setBoardListener(selectedCard[k]);
            }
        } else {
            gameAlert.innerHTML = "<div style='background-color: rgba(218,112,214,0.35); border: 1px solid crimson; color: crimson'>The card you select can not be a set</div>";
            for (let k = 0; k < 3; k++) {
                changeSelectStatus(boardCard[selectedCard[k]]);
            }

        }
    }
}

function setBoardListener(card) {
    boardCard[card].addEventListener("click", function () {
        changeSelectStatus(boardCard[card]);
        gameAlert.innerHTML = "";
        checkSelectCards();
    })
}

shuffle();