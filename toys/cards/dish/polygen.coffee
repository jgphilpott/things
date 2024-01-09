polygen = (type = "bridge", decks = 1, text = false, font = "garamond") ->

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

    # Create the corner cutouts.

    exteriorCornerCutter = new Cylinder().setRadialSegments(40)
    exteriorCornerCutter.setLength(deckThickness + thickness)
    exteriorCornerCutter.setPositiveRadius(thickness).setNegativeRadius(thickness)

    interiorCornerCutter = new Cylinder().setRadialSegments(40)
    interiorCornerCutter.setLength(deckThickness).setPositionZ(thickness / 2)
    interiorCornerCutter.setPositiveRadius(thickness).setNegativeRadius(thickness - cardPadding)

    # Round the NE corner.

    exteriorCornerCutterNE = new Box().setWidth(thickness).setLength(thickness).setHeight(deckThickness + thickness)
    exteriorCornerCutterNE.setPositionX(cardWidth + (cardPadding * 4) + thickness)
    exteriorCornerCutterNE.setPositionY((cardLength / 2) + (cardPadding * 2) + (thickness / 2))

    interiorCornerCutterNE = new Box().setWidth(thickness).setLength(thickness).setHeight(deckThickness).setPositionZ(thickness / 2)
    interiorCornerCutterNE.setPositionX(cardWidth + (cardPadding * 4))
    interiorCornerCutterNE.setPositionY((cardLength / 2) + (cardPadding * 2) - (thickness / 2))

    exteriorCornerCutter.setPositionX(cardWidth + (cardPadding * 4) + (thickness / 2))
    exteriorCornerCutter.setPositionY((cardLength / 2) + (cardPadding * 2))

    interiorCornerCutter.setPositionX(cardWidth + (cardPadding * 4) - (thickness / 2))
    interiorCornerCutter.setPositionY((cardLength / 2) + (cardPadding * 2) - thickness)

    exteriorCornerCutterNE = morph "cut", exteriorCornerCutterNE, exteriorCornerCutter
    dish = morph "cut", dish, exteriorCornerCutterNE

    interiorCornerCutterNE = morph "cut", interiorCornerCutterNE, interiorCornerCutter
    dish = morph "join", dish, interiorCornerCutterNE

    interiorCornerCutterNE.position.x = -(cardWidth + (cardPadding * 4) + thickness)
    dish = morph "join", dish, interiorCornerCutterNE

    # Round the SE corner.

    exteriorCornerCutterSE = new Box().setWidth(thickness).setLength(thickness).setHeight(deckThickness + thickness)
    exteriorCornerCutterSE.setPositionX(cardWidth + (cardPadding * 4) + thickness)
    exteriorCornerCutterSE.setPositionY(-((cardLength / 2) + (cardPadding * 2) + (thickness / 2)))

    interiorCornerCutterSE = new Box().setWidth(thickness).setLength(thickness).setHeight(deckThickness).setPositionZ(thickness / 2)
    interiorCornerCutterSE.setPositionX(cardWidth + (cardPadding * 4))
    interiorCornerCutterSE.setPositionY(-((cardLength / 2) + (cardPadding * 2) - (thickness / 2)))

    exteriorCornerCutter.setPositionX(cardWidth + (cardPadding * 4) + (thickness / 2))
    exteriorCornerCutter.setPositionY(-((cardLength / 2) + (cardPadding * 2)))

    interiorCornerCutter.setPositionX(cardWidth + (cardPadding * 4) - (thickness / 2))
    interiorCornerCutter.setPositionY(-((cardLength / 2) + (cardPadding * 2) - thickness))

    exteriorCornerCutterSE = morph "cut", exteriorCornerCutterSE, exteriorCornerCutter
    dish = morph "cut", dish, exteriorCornerCutterSE

    interiorCornerCutterSE = morph "cut", interiorCornerCutterSE, interiorCornerCutter
    dish = morph "join", dish, interiorCornerCutterSE

    interiorCornerCutterSE.position.x = -(cardWidth + (cardPadding * 4) + thickness)
    dish = morph "join", dish, interiorCornerCutterSE

    # Round the SW corner.

    exteriorCornerCutterSW = new Box().setWidth(thickness).setLength(thickness).setHeight(deckThickness + thickness)
    exteriorCornerCutterSW.setPositionX(-(cardWidth + (cardPadding * 4) + thickness))
    exteriorCornerCutterSW.setPositionY(-((cardLength / 2) + (cardPadding * 2) + (thickness / 2)))

    interiorCornerCutterSW = new Box().setWidth(thickness).setLength(thickness).setHeight(deckThickness).setPositionZ(thickness / 2)
    interiorCornerCutterSW.setPositionX(-(cardWidth + (cardPadding * 4)))
    interiorCornerCutterSW.setPositionY(-((cardLength / 2) + (cardPadding * 2) - (thickness / 2)))

    exteriorCornerCutter.setPositionX(-(cardWidth + (cardPadding * 4) + (thickness / 2)))
    exteriorCornerCutter.setPositionY(-((cardLength / 2) + (cardPadding * 2)))

    interiorCornerCutter.setPositionX(-(cardWidth + (cardPadding * 4) - (thickness / 2)))
    interiorCornerCutter.setPositionY(-((cardLength / 2) + (cardPadding * 2) - thickness))

    exteriorCornerCutterSW = morph "cut", exteriorCornerCutterSW, exteriorCornerCutter
    dish = morph "cut", dish, exteriorCornerCutterSW

    interiorCornerCutterSW = morph "cut", interiorCornerCutterSW, interiorCornerCutter
    dish = morph "join", dish, interiorCornerCutterSW

    interiorCornerCutterSW.position.x = cardWidth + (cardPadding * 4) + thickness
    dish = morph "join", dish, interiorCornerCutterSW

    # Round the NW corner.

    exteriorCornerCutterNW = new Box().setWidth(thickness).setLength(thickness).setHeight(deckThickness + thickness)
    exteriorCornerCutterNW.setPositionX(-(cardWidth + (cardPadding * 4) + thickness))
    exteriorCornerCutterNW.setPositionY((cardLength / 2) + (cardPadding * 2) + (thickness / 2))

    interiorCornerCutterNW = new Box().setWidth(thickness).setLength(thickness).setHeight(deckThickness).setPositionZ(thickness / 2)
    interiorCornerCutterNW.setPositionX(-(cardWidth + (cardPadding * 4)))
    interiorCornerCutterNW.setPositionY((cardLength / 2) + (cardPadding * 2) - (thickness / 2))

    exteriorCornerCutter.setPositionX(-(cardWidth + (cardPadding * 4) + (thickness / 2)))
    exteriorCornerCutter.setPositionY((cardLength / 2) + (cardPadding * 2))

    interiorCornerCutter.setPositionX(-(cardWidth + (cardPadding * 4) - (thickness / 2)))
    interiorCornerCutter.setPositionY((cardLength / 2) + (cardPadding * 2) - thickness)

    exteriorCornerCutterNW = morph "cut", exteriorCornerCutterNW, exteriorCornerCutter
    dish = morph "cut", dish, exteriorCornerCutterNW

    interiorCornerCutterNW = morph "cut", interiorCornerCutterNW, interiorCornerCutter
    dish = morph "join", dish, interiorCornerCutterNW

    interiorCornerCutterNW.position.x = cardWidth + (cardPadding * 4) + thickness
    dish = morph "join", dish, interiorCornerCutterNW

    # Create the slot cutouts.

    slotCutterRadius = (cardWidth + (cardPadding * 2)) / 6

    roundSlotCutter = new Cylinder().setRadialSegments(40)
    roundSlotCutter.setLength(deckThickness + thickness + satoshi)
    roundSlotCutter.setPositiveRadius(slotCutterRadius).setNegativeRadius(slotCutterRadius)

    angledSlotCutter = new Cylinder().setRadialSegments(4)
    angledSlotCutter.setLength(deckThickness + satoshi).setPositionZ(thickness / 2)
    angledSlotCutter.setPositiveRadius(side$sides(slotCutterRadius + (cardPadding * 2), slotCutterRadius + (cardPadding * 2)))
    angledSlotCutter.setNegativeRadius(side$sides(slotCutterRadius, slotCutterRadius))
    angledSlotCutter.rotation.y = deg$rad 45

    squareSlotCutter = new Box().setHeight(deckThickness + thickness + satoshi)
    squareSlotCutter.setWidth(slotCutterRadius * 2).setLength(slotCutterRadius * 2)

    # Cut the slots for the draw dish.

    roundSlotCutter.setPositionX(cardWidth + (cardPadding * 3) + (thickness / 2))
    angledSlotCutter.setPositionX((cardWidth + (cardPadding * 3) + (thickness / 2)) + slotCutterRadius)
    squareSlotCutter.setPositionX((cardWidth + (cardPadding * 3) + (thickness / 2)) + slotCutterRadius)

    dish = morph "cut", dish, roundSlotCutter
    dish = morph "cut", dish, angledSlotCutter
    dish = morph "cut", dish, squareSlotCutter

    roundSlotCutter.setPositionX((cardWidth / 2) + (cardPadding * 2) + (thickness / 2))
    angledSlotCutter.setPositionX((cardWidth / 2) + (cardPadding * 2) + (thickness / 2))
    squareSlotCutter.setPositionX((cardWidth / 2) + (cardPadding * 2) + (thickness / 2))

    roundSlotCutter.setPositionY((cardLength / 2) + cardPadding)
    angledSlotCutter.setPositionY(((cardLength / 2) + cardPadding) + slotCutterRadius)
    squareSlotCutter.setPositionY(((cardLength / 2) + cardPadding) + slotCutterRadius)

    dish = morph "cut", dish, roundSlotCutter
    dish = morph "cut", dish, angledSlotCutter
    dish = morph "cut", dish, squareSlotCutter

    roundSlotCutter.setPositionY(-(cardLength / 2) - cardPadding)
    angledSlotCutter.setPositionY((-(cardLength / 2) - cardPadding) - slotCutterRadius)
    squareSlotCutter.setPositionY((-(cardLength / 2) - cardPadding) - slotCutterRadius)

    dish = morph "cut", dish, roundSlotCutter
    dish = morph "cut", dish, angledSlotCutter
    dish = morph "cut", dish, squareSlotCutter

    # Cut the slots for the discard dish.

    roundSlotCutter.setPositionX(-((cardWidth / 2) + (cardPadding * 2) + (thickness / 2)))
    squareSlotCutter.setPositionX(-((cardWidth / 2) + (cardPadding * 2) + (thickness / 2)))

    roundSlotCutter.setPositionY(slotCutterRadius)
    dish = morph "cut", dish, roundSlotCutter
    roundSlotCutter.setPositionY(-slotCutterRadius)
    dish = morph "cut", dish, roundSlotCutter

    squareSlotCutter.setPositionY(0)
    dish = morph "cut", dish, squareSlotCutter

    # Add the text labels.

    if text

        draw = new Text().setSize(cardWidth / 6).setHeight(thickness)
        discard = new Text().setSize(cardWidth / 6).setHeight(thickness)

        draw.setPositionX(cardWidth / 5).setPositionZ(-((deckThickness - thickness) / 2))
        discard.setPositionX(-(cardWidth / 5)).setPositionZ(-((deckThickness - thickness) / 2))

        draw.setText("Draw").setFont(font)
        discard.setText("Discard").setFont(font)

        draw.rotation.z = deg$rad -90
        discard.rotation.z = deg$rad 90

        # dish = morph "cut", dish, draw
        # dish = morph "cut", dish, discard
        # CSG is not currently working with text meshes.
        # https://github.com/jgphilpott/polymorph/issues/16

    # Done!

    scene.add dish
