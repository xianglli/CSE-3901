export let cardDeck;

cardDeck = [...new Array(81).keys()];

function suffle(arr) {
    var n = arr.length;
    var newArr = [];
    while(n) {
        var i = Math.floor(Math.random()*n--);
        newArr.push(arr.splice(i, 1)[0]);
    }
    return newArr;
 }

cardDeck = suffle(cardDeck);