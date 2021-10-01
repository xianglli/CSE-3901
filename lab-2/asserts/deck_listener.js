// Deck listener file is for control cards
const container = document.getElementsByClassName('cardboard');
const boardCard = document.getElementsByClassName("card");
const gameAlert = document.getElementsByClassName("boardMessage")[0]

function changeSelectStatus(card) {
    card.selected = !card.selected;
    if (card.selected) {
        card.style.backgroundColor = "#ffff00";
    } else {
        card.style.backgroundColor = "#e6e6e6";
    }
}

for (let i = 0; i < 12; i++) {
    const card = createRandomCard();
    container[0].append(card);
}

for (let i = 0; i < 12; i++) {
    boardCard[i].addEventListener("click", function () {
        changeSelectStatus(boardCard[i]);

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
                for (let k = 0; k < 3; k++) {
                    boardCard[selectedCard[k]] = createRandomCard();
                }
            } else {
                gameAlert.innerHTML = "The card you select can not be a set";
                for (let k = 0; k < 3; k++) {
                    changeSelectStatus(boardCard[selectedCard[k]]);
                }
            }
        }
    })
}