const container = document.getElementsByClassName('cardboard')[0];
let CARD_DECK;

function createCard(label) {
    const card = document.createElement('div');
    card.className = "card";
    card.innerHTML = "<img src=\"./media/cards/" + (label + 1) + ".png\" />";
    card.label = label;
    card.selected = false;
    return card;
}

function shuffleArr(arr) {
    let n = arr.length;
    const newArr = [];
    while (n) {
        const i = Math.floor(Math.random() * n--);
        newArr.push(arr.splice(i, 1)[0]);
    }
    return newArr;
}

function shuffle() {
    while (container.firstChild) {
        container.removeChild(container.firstChild);
    }
    CARD_DECK = shuffleArr([...new Array(81).keys()]);
    for (let i = 0; i < 12; i++) {
        const card = createRandomCard();
        container.append(card);
    }
    
    for (let i = 0; i < 12; i++) {
        setBoardListener(i);
    }
}

function createRandomCard() {
    return createCard(CARD_DECK.pop());
}
