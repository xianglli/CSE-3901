const container = document.getElementsByClassName('cardboard');

for (let i = 0; i < 12; i++) {
    const card = createRandomCard();
    container[0].append(card);
}