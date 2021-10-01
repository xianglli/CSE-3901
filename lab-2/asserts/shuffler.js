let CARD_DECK = [...new Array(81).keys()];

function createCard(label) {
    const card = document.createElement('div');
    card.className = "card";
    card.innerHTML = "<img src=\"../media/cards/"+(label+1)+".png\" />";
    return card;
}

function createRandomCard() {
    let index = Math.floor(Math.random() * CARD_DECK.length);
    return createCard(CARD_DECK[index]);
}
