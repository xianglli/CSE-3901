function getCardId(card) {
    let tmp = card;
    let remainder = 0;
    let i = 0;
    let result = 0;
    while (Math.floor(tmp / 3) != 0) {
        remainder = tmp % 3;
        result += remainder * (10 ** i);
        i = i + 1;
        tmp = Math.floor(tmp / 3);
    }
    result += tmp * (10 ** i);
    return result;
}

getCardId(34)

function getSymbol(card_id) {
    return Math.floor(card_id / 1000);
}

function getShape(card_id) {
    return Math.floor(card_id / 100) % 10;
}

function getColor(card_id) {
    return Math.floor(card_id / 10) % 10;
}

function getNumber(card_id) {
    return card_id % 10;
}

export function cardChecker(card1, card2, card3) {
    let shape_equal = (getShape(getCardId(card1)) === getShape(getCardId(card2)) && getShape(getCardId(card2)) === getShape(getCardId(card3)));
    let shape_diff = (getShape(getCardId(card1)) !== getShape(getCardId(card2)) && getShape(getCardId(card2)) !== getShape(getCardId(card3))
        && getShape(getCardId(card3)) !== getShape(getCardId(card1)));
    let color_equal = (getColor(getCardId(card1)) === getColor(getCardId(card2)) && getColor(getCardId(card2)) === getColor(getCardId(card3)));
    let color_diff = (getColor(getCardId(card1)) !== getColor(getCardId(card2)) && getColor(getCardId(card2)) !== getColor(getCardId(card3))
        && getColor(getCardId(card3)) !== getColor(getCardId(card1)));
    let symbol_equal = (getSymbol(getCardId(card1)) === getSymbol(getCardId(card2)) && getSymbol(getCardId(card2)) === getSymbol(getCardId(card3)));
    let symbol_diff = (getSymbol(getCardId(card1)) !== getSymbol(getCardId(card2)) && getSymbol(getCardId(card2)) !== getSymbol(getCardId(card3))
        && getSymbol(getCardId(card3)) !== getSymbol(getCardId(card1)));
    let number_equal = (getNumber(getCardId(card1)) === getNumber(getCardId(card2)) && getNumber(getCardId(card2)) === getNumber(getCardId(card3)));
    let number_diff = (getNumber(getCardId(card1)) !== getNumber(getCardId(card2)) && getNumber(getCardId(card2)) !== getNumber(getCardId(card3))
        && getNumber(getCardId(card3)) !== getNumber(getCardId(card1)));
    return (shape_equal || shape_diff) && (color_equal || color_diff) && (symbol_equal || symbol_diff) && (number_equal || number_diff);
}