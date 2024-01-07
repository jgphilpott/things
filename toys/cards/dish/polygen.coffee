polygen = (type = "bridge") ->

    cardWidth = 0
    cardHeight = 0
    deckThickness = 0

    if type is "bridge"

        cardWidth = inch$mm 2.25
        cardHeight = inch$mm 3.5
        deckThickness = inch$mm 0.75

    if type is "mini"

        cardWidth = inch$mm 1.75
        cardHeight = inch$mm 2.5
        deckThickness = inch$mm 0.75

    if type is "poker"

        cardWidth = inch$mm 2.5
        cardHeight = inch$mm 3.5
        deckThickness = inch$mm 0.75

    if type is "tarot"

        cardWidth = inch$mm 2.75
        cardHeight = inch$mm 4.75
        deckThickness = inch$mm 0.75

    log cardWidth
    log cardHeight
    log deckThickness