function hint() {
    let count = 0;
    for(let i = 0; i <= 9; i++) {
        for(let j = i + 1; j <= 10; j++) {
            for(let k = j + 1; k <= 11; k++) {
                if (cardChecker(boardCard[i].label, boardCard[j].label, boardCard[k].label)) {
                    count++;
                }
            }
        }
    }
    return count;
}