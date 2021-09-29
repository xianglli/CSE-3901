export let cardDeck;

cardDeck = [...new Array(81).keys()];

function suffle(arr) {
    let n = arr.length;
    const newArr = [];
    while (n) {
        const i = Math.floor(Math.random() * n--);
        newArr.push(arr.splice(i, 1)[0]);
    }
    return newArr;
}

cardDeck = suffle(cardDeck);