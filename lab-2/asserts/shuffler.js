let CARD_DECK = [...new Array(81).keys()];

function createCard(label) {
    const card = document.createElement('div');
    card.className = "card";
    card.innerHTML = "<img src=\"../media/cards/" + (label + 1) + ".png\" />";
    card.label = label;
    card.selected = false;
    return card;
}

function shuffle(arr) {
    let n = arr.length;
    const newArr = [];
    while (n) {
        const i = Math.floor(Math.random() * n--);
        newArr.push(arr.splice(i, 1)[0]);
    }
    return newArr;
}

CARD_DECK = shuffle(CARD_DECK);

function createRandomCard() {
    return createCard(CARD_DECK.pop());
}
