polygen = (item = "cup", cupTopSupport = true) -> # Item should = 'cup', 'stick' or 'stand'.

    # Basic Variables

    cupRadius = 18
    cupHeight = 18
    cupThickness = 1.8

    slotCount = 3
    slotWidth = 4
    slotAngle = 360 / slotCount

    stickRadius = 2.65
    stickHeight = 300
    stickThickness = 0.65
    stickAttachmentSize = 10

    # Mesh Setup

    if item is "cup"

        cup = new Cone().setHeight(cupHeight).setRadius(cupRadius)
        cupCut = new Cone().setHeight(cupHeight).setRadius(cupRadius).setPositionZ(-cupThickness)

        cupTop = new Cylinder().setPositiveRadius(stickRadius + cupThickness).setNegativeRadius(stickRadius + cupThickness)
        cupTop.setLength(stickAttachmentSize).setPositionZ((stickAttachmentSize / 2) + (cupHeight / 4))

        cupTopCut = new Cylinder().setPositiveRadius(stickRadius + (stickThickness / 2)).setNegativeRadius(stickRadius + (stickThickness / 2))
        cupTopCut.setLength(stickAttachmentSize).setPositionZ((stickAttachmentSize / 2) + (cupHeight / 4) + cupThickness)

        slotBox = new Box().setWidth(slotWidth).setLength(cupRadius).setHeight(cupHeight * 2).setPositionY(cupRadius)

        slotEnd = new Cylinder().setPositiveRadius(slotWidth).setNegativeRadius(slotWidth).setLength(cupHeight)
        slotEnd.setPositionY(cupRadius / 2).setRotationX(deg$rad(45))

        if cupTopSupport

            cupTopSupport = new Cylinder().setPositiveRadius(stickThickness).setNegativeRadius(stickThickness).setLength(cupHeight)
            cupTopSupport.setPositionY(cupRadius / 2).setPositionZ(-stickThickness / 2).setRotationX(deg$rad(-50))

    else if item is "stick"

        stick = new Cylinder().setPositiveRadius(stickRadius).setNegativeRadius(stickRadius).setLength(stickHeight)
        stickCut = new Cylinder().setPositiveRadius(stickRadius - stickThickness).setNegativeRadius(stickRadius - stickThickness).setLength(stickHeight + stickThickness)

    # Perform CSG

    if item is "cup"

        settings.set "ui.title", "cup (" + slotCount + " slots)"

        if cupTopSupport

            cupTopSupport = morph "cut", cupTopSupport, cupTopCut
            cupTopSupport = morph "cut", cupTopSupport, cupCut

            cupTopSupport.position.y += 0.1

            slotAngle /= 2

        cupTop = morph "cut", cupTop, cupTopCut
        cup = morph "cut", cup, cupCut

        for slot in [0...slotCount]

            cup = morph "cut", cup, slotEnd
            cup = morph "cut", cup, slotBox

            cup.rotation.z += deg$rad slotAngle

            if cupTopSupport

                cup = morph "join", cup, cupTopSupport

                cup.rotation.z += deg$rad slotAngle

        cup = morph "cut", cup, cupTopCut
        cup = morph "join", cup, cupTop

        scene.add cup

    else if item is "stick"

        settings.set "ui.title", "stick"

        stick = morph "cut", stick, stickCut

        scene.add stick

    else if item is "stand"

        settings.set "ui.title", "stand"
