document.addEventListener('DOMContentLoaded', () => {

    const cardArray = [
        {
            name: 'simone',
            img: 'images/simone.jpeg'
        },
        {
            name: 'paolo',
            img: 'images/paolo.jpeg'
        },
        {
            name: 'katia',
            img: 'images/katia.jpeg'
        },
        {
            name: 'claudia',
            img: 'images/claudia.jpeg'
        },
        {
            name: 'cat',
            img: 'images/cat.jpeg'
        },
        {
            name: 'dog',
            img: 'images/dog.png'
        },
        {
            name: 'simone',
            img: 'images/simone.jpeg'
        },
        {
            name: 'paolo',
            img: 'images/paolo.jpeg'
        },
        {
            name: 'katia',
            img: 'images/katia.jpeg'
        },
        {
            name: 'claudia',
            img: 'images/claudia.jpeg'
        },
        {
            name: 'cat',
            img: 'images/cat.jpeg'
        },
        {
            name: 'dog',
            img: 'images/dog.png'
        }
    ]

    cardArray.sort(() => 0.5 - Math.random())
    const grid = document.querySelector('.grid')
    const container = document.querySelector('.container')
    const resultDisplay = document.querySelector('#result')
    resultDisplay.textContent = 0;
    let cardChosen = []
    let cardChosenId = []
    let cardsWonId = []
    let flippedCard = 0
    let starter = setInterval(() => resultDisplay.textContent++, 250);


    function createBoard() {
        for (let index = 0; index < cardArray.length; index++) {
            let card = document.createElement('img');
            setAttribute(card, 'images/blank.jpeg');
            card.setAttribute('data-id', index);
            card.addEventListener('click', flipCard);
            grid.appendChild(card);
        }
    }

    function setAttribute(card, src) {
        card.setAttribute('src', src);
        card.setAttribute('height', 100);
        card.setAttribute('width', 100);
        // card.setAttribute('border', '3 solid #ddd');
    }

    function checkForMatch() {
        let cards = document.querySelectorAll('img');
        const optionOneId = cardChosenId[0];
        const optionTwoId = cardChosenId[1];
        if (cardChosen[0] === cardChosen[1] && optionOneId != optionTwoId) {
            setAttribute(cards[optionOneId], "images/white.png");
            setAttribute(cards[optionTwoId], "images/white.png");
            cardsWonId.push(optionOneId)
            cardsWonId.push(optionTwoId)
        } else {
            setAttribute(cards[optionOneId], "images/blank.jpeg");
            setAttribute(cards[optionTwoId], "images/blank.jpeg");
        }
        cardChosen = [];
        cardChosenId = [];
        if (cardsWonId.length === cardArray.length) {
            clearInterval(starter)
            grid.innerHTML = ""
            let finalCard = cardArray[Math.floor(Math.random() * cardArray.length)];
            let finalImg = document.createElement('img');
            finalImg.setAttribute('src', finalCard.img);
            finalImg.setAttribute('height', '100%');
            finalImg.setAttribute('width', '100%');
            grid.appendChild(finalImg);
            let finalText = document.createElement('h1');
            finalText.setAttribute('align', 'center');
            finalText.textContent = `FINE`;
            container.appendChild(finalText);
        }
    }

    function flipCard() {
        let cardId = this.getAttribute('data-id')
        if (cardsWonId.includes(cardId) || flippedCard > 2) {
            return;
        }
        cardChosen.push(cardArray[cardId].name)
        cardChosenId.push(cardId)
        setAttribute(this, cardArray[cardId].img)
        if (cardChosen.length === 2) {
            setTimeout(checkForMatch, 150)
        }
    }

    createBoard()
})