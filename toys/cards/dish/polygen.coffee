polygen = (type = "bridge", decks = 1) ->

    # Declare some basic variables.

    thickness = 3
    cardWidth = null
    cardLength = null
    cardPadding = 2.5
    deckThickness = null

    # Determine deck size based on card type.

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
    satoshi = 0.000001

    # Create the card dish.

    dish = new Box()

    dish.setWidth((cardWidth * 2) + (cardPadding * 8) + (thickness * 3))
    dish.setLength(cardLength + (cardPadding * 4) + (thickness * 2))
    dish.setHeight(deckThickness + thickness)
    dish.setColor(blueThree)

    # Create the deck cutout.

    lengthOffset = ((cardLength + (cardPadding * 4)) - (cardWidth + (cardPadding * 4))) / 2

    halfTopWidth = (cardWidth / 2) + (cardPadding * 2)
    halfBottomWidth = (cardWidth / 2) + cardPadding

    deck = new Cylinder().setRadialSegments(4)
    deck.setPositiveRadius(side$sides(halfTopWidth, halfTopWidth))
    deck.setNegativeRadius(side$sides(halfBottomWidth, halfBottomWidth))
    deck.setLength(deckThickness)
    deck.rotation.y = deg$rad 45
    deck.setPositionZ((thickness / 2) + satoshi)
    deck.setColor(redThree)

    # Hollow out the card dish with the deck cutout.

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

    # Create the corner cutout.

    cornerCutter = new Cylinder().setRadialSegments(40)
    cornerCutter.setLength(deckThickness + thickness)
    cornerCutter.setPositiveRadius(thickness).setNegativeRadius(thickness)

    # Cut the NE corner.

    cornerCutterNE = new Box().setWidth(thickness).setLength(thickness).setHeight(deckThickness + thickness)
    cornerCutterNE.setPositionX(cardWidth + (cardPadding * 4) + thickness)
    cornerCutterNE.setPositionY((cardLength / 2) + (cardPadding * 2) + (thickness / 2))

    cornerCutter.setPositionX(cardWidth + (cardPadding * 4) + (thickness / 2))
    cornerCutter.setPositionY((cardLength / 2) + (cardPadding * 2))

    cornerCutterNE = morph "cut", cornerCutterNE, cornerCutter
    dish = morph "cut", dish, cornerCutterNE
    cornerCutterNE.position.x -= thickness
    cornerCutterNE.position.y -= thickness
    dish = morph "join", dish, cornerCutterNE
    cornerCutterNE.position.x -= cardWidth + (cardPadding * 4) + thickness
    dish = morph "join", dish, cornerCutterNE

    # Cut the SE corner.

    cornerCutterSE = new Box().setWidth(thickness).setLength(thickness).setHeight(deckThickness + thickness)
    cornerCutterSE.setPositionX(cardWidth + (cardPadding * 4) + thickness)
    cornerCutterSE.setPositionY(-((cardLength / 2) + (cardPadding * 2) + (thickness / 2)))

    cornerCutter.setPositionX(cardWidth + (cardPadding * 4) + (thickness / 2))
    cornerCutter.setPositionY(-((cardLength / 2) + (cardPadding * 2)))

    cornerCutterSE = morph "cut", cornerCutterSE, cornerCutter
    dish = morph "cut", dish, cornerCutterSE
    cornerCutterSE.position.x -= thickness
    cornerCutterSE.position.y += thickness
    dish = morph "join", dish, cornerCutterSE
    cornerCutterSE.position.x -= cardWidth + (cardPadding * 4) + thickness
    dish = morph "join", dish, cornerCutterSE

    # Cut the SW corner.

    cornerCutterSW = new Box().setWidth(thickness).setLength(thickness).setHeight(deckThickness + thickness)
    cornerCutterSW.setPositionX(-(cardWidth + (cardPadding * 4) + thickness))
    cornerCutterSW.setPositionY(-((cardLength / 2) + (cardPadding * 2) + (thickness / 2)))

    cornerCutter.setPositionX(-(cardWidth + (cardPadding * 4) + (thickness / 2)))
    cornerCutter.setPositionY(-((cardLength / 2) + (cardPadding * 2)))

    cornerCutterSW = morph "cut", cornerCutterSW, cornerCutter
    dish = morph "cut", dish, cornerCutterSW
    cornerCutterSW.position.x += thickness
    cornerCutterSW.position.y += thickness
    dish = morph "join", dish, cornerCutterSW
    cornerCutterSW.position.x += cardWidth + (cardPadding * 4) + thickness
    dish = morph "join", dish, cornerCutterSW

    # Cut the NW corner.

    cornerCutterNW = new Box().setWidth(thickness).setLength(thickness).setHeight(deckThickness + thickness)
    cornerCutterNW.setPositionX(-(cardWidth + (cardPadding * 4) + thickness))
    cornerCutterNW.setPositionY((cardLength / 2) + (cardPadding * 2) + (thickness / 2))

    cornerCutter.setPositionX(-(cardWidth + (cardPadding * 4) + (thickness / 2)))
    cornerCutter.setPositionY((cardLength / 2) + (cardPadding * 2))

    cornerCutterNW = morph "cut", cornerCutterNW, cornerCutter
    dish = morph "cut", dish, cornerCutterNW
    cornerCutterNW.position.x += thickness
    cornerCutterNW.position.y -= thickness
    dish = morph "join", dish, cornerCutterNW
    cornerCutterNW.position.x += cardWidth + (cardPadding * 4) + thickness
    dish = morph "join", dish, cornerCutterNW

    # Done!

    scene.add dish
