// Deck listener file is for control files of
const container = document.getElementsByClassName('cardboard');

for (let i = 0; i < 12; i++) {
    const card = createRandomCard();
    container[0].append(card);
}

const boardCard = document.getElementsByClassName("card");

for (let i = 0; i < 12; i++) {
    boardCard[i].addEventListener("click", function () {
        boardCard[i].selected = !boardCard[i].selected;
        if (boardCard[i].selected) {
            boardCard[i].style.backgroundColor = "#ffff00";
        } else {
            boardCard[i].style.backgroundColor = "#e6e6e6";
        }
        document.getElementsByClassName("boardMessage").innerHTML = "Hello World";
    })
}