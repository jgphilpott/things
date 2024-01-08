polygen = (type = "bridge", decks = 1) ->

    thickness = 3
    cardWidth = null
    cardLength = null
    cardPadding = 2.5
    deckThickness = null

    if type is "bridge"

        cardWidth = inch$mm 2.25
        cardLength = inch$mm 3.5
        deckThickness = inch$mm 0.75

    if type is "mini"

        cardWidth = inch$mm 1.75
        cardLength = inch$mm 2.5
        deckThickness = inch$mm 0.75

    if type is "poker"

        cardWidth = inch$mm 2.5
        cardLength = inch$mm 3.5
        deckThickness = inch$mm 0.75

    if type is "tarot"

        cardWidth = inch$mm 2.75
        cardLength = inch$mm 4.75
        deckThickness = inch$mm 0.75

    deckThickness *= decks

    dish = new Box()

    dish.setWidth((cardWidth * 2) + (cardPadding * 8) + (thickness * 3))
    dish.setLength(cardLength + (cardPadding * 4) + (thickness * 2))
    dish.setHeight(deckThickness + thickness)
    dish.setColor(blueThree)

    lengthOffset = ((cardLength + (cardPadding * 4)) - (cardWidth + (cardPadding * 4))) / 2

    halfTopWidth = (cardWidth / 2) + (cardPadding * 2)
    halfBottomWidth = (cardWidth / 2) + cardPadding

    deck = new Cylinder().setRadialSegments(4)
    deck.setPositiveRadius(side$sides(halfTopWidth, halfTopWidth))
    deck.setNegativeRadius(side$sides(halfBottomWidth, halfBottomWidth))
    deck.setLength(deckThickness + thickness)
    deck.rotation.y = deg$rad 45
    deck.setPositionZ(thickness)
    deck.setColor(redThree)

    deck.setPositionX(halfTopWidth + (thickness / 2))

    deck.setPositionY(lengthOffset)
    dish = morph "cut", dish, deck

    deck.setPositionY(-lengthOffset)
    dish = morph "cut", dish, deck

    deck.setPositionX(-(halfTopWidth + (thickness / 2)))

    deck.setPositionY(lengthOffset)
    dish = morph "cut", dish, deck

    deck.setPositionY(-lengthOffset)
    dish = morph "cut", dish, deck

    scene.add dish
