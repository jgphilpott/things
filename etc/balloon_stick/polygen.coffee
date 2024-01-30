polygen = (item = "cup") -> # Item should = 'cup', 'stick' or 'stand'.

    # Basic Variables

    cupRadius = 18
    cupHeight = 18
    cupSegments = 100
    cupThickness = 1.8
    cupTopSupport = true

    slotCount = 3
    slotWidth = 4
    slotSegments = 60
    slotAngle = 360 / slotCount

    stickRadius = 2.65
    stickHeight = 300
    stickThickness = 0.65
    stickAttachmentSize = 12
    stickHollow = true

    standLayers = 3
    standPoints = 8
    standRadius = 50
    standSegments = 80
    standAngle = 360 / standPoints

    # Mesh Setup

    if item is "cup"

        cup = new Cone().setHeight(cupHeight).setRadius(cupRadius).setRadialSegments(cupSegments)
        cupCut = new Cone().setHeight(cupHeight).setRadius(cupRadius).setPositionZ(-cupThickness).setRadialSegments(cupSegments)

        cupTop = new Cylinder().setPositiveRadius(stickRadius + 1).setNegativeRadius(stickRadius + 1)
        cupTop.setLength(stickAttachmentSize).setPositionZ((stickAttachmentSize / 2) + (cupHeight / 4)).setRadialSegments(cupSegments)

        cupTopCut = new Cylinder().setPositiveRadius(stickRadius + (stickThickness / 5)).setNegativeRadius(stickRadius + (stickThickness / 5))
        cupTopCut.setLength(stickAttachmentSize).setPositionZ((stickAttachmentSize / 2) + (cupHeight / 4) + cupThickness).setRadialSegments(cupSegments)

        cupLip = new Cylinder().setPositiveRadius(cupRadius + (cupThickness / 6)).setNegativeRadius(cupRadius + (cupThickness / 6)).setLength(cupThickness / 2)
        cupLip.setPositionZ((-cupHeight / 2) + (cupThickness / 4)).setRadialSegments(cupSegments)

        slotBox = new Box().setWidth(slotWidth).setLength(cupRadius).setHeight(cupHeight * 2).setPositionY(cupRadius)

        slotEnd = new Cylinder().setPositiveRadius(slotWidth).setNegativeRadius(slotWidth).setLength(cupHeight)
        slotEnd.setPositionY(cupRadius / 2).setRotationX(deg$rad(45)).setRadialSegments(slotSegments)

        if cupTopSupport

            cupTopSupport = new Cylinder().setPositiveRadius(stickThickness).setNegativeRadius(stickThickness).setLength(cupHeight + 1)
            cupTopSupport.setPositionY(cupRadius / 2).setPositionZ(-stickThickness / 2).setRotationX(deg$rad(-50)).setRadialSegments(slotSegments)

    else if item is "stick"

        stick = new Cylinder().setPositiveRadius(stickRadius).setNegativeRadius(stickRadius).setLength(stickHeight)
        stickCut = new Cylinder().setPositiveRadius(stickRadius - stickThickness).setNegativeRadius(stickRadius - stickThickness).setLength(stickHeight + stickThickness)

    else if item is "stand"

        stand = new Sphere().setRadius(standRadius).setThetaSegments(standSegments).setPhiSegments(standSegments).setScaleY(50)
        standCut = new Box().setWidth(standRadius * 2 + 1).setLength(standRadius * 2 + 1).setHeight(standRadius).setPositionZ(-standRadius / 2)

        stickCut = new Cylinder().setPositiveRadius(stickRadius + (stickThickness / 5)).setNegativeRadius(stickRadius + (stickThickness / 5))
        stickCut.setLength(stickHeight).setPositionZ((stickHeight / 2) + (standRadius / 4))

    # Perform CSG

    if item is "cup"

        settings.set "ui.title", "cup (" + slotCount + " slots)"

        if cupTopSupport

            cupTopSupport = morph "cut", cupTopSupport, cupTopCut
            cupTopSupport = morph "cut", cupTopSupport, cupCut

            cupTopSupport.position.y += 0.1

            slotAngle /= 2

        cupTop = morph "cut", cupTop, cupTopCut

        cup = morph "join", cup, cupLip
        cup = morph "cut", cup, cupCut

        for slot in [0...slotCount]

            cup = morph "cut", cup, slotBox
            cup = morph "cut", cup, slotEnd

            cup.rotation.z += deg$rad slotAngle

            if cupTopSupport

                cup = morph "join", cup, cupTopSupport

                cup.rotation.z += deg$rad slotAngle

        cup = morph "cut", cup, cupTopCut
        cup = morph "join", cup, cupTop

        scene.add cup

    else if item is "stick"

        if stickHollow

            stickType = "hollow"

        else

            stickType = "solid"

        settings.set "ui.title", "stick (" + stickHeight / 10 + "cm " + stickType + ")"

        if stickHollow

            stick = morph "cut", stick, stickCut

        scene.add stick

    else if item is "stand"

        settings.set "ui.title", "stand (" + standPoints + " points)"

        stand = morph "cut", stand, standCut

        if standLayers >= 1

            stand = morph "cut", stand, stickCut

            if standLayers >= 2

                stickCut.position.z -= standRadius / 3
                stickCut.position.y -= standRadius * 1.333
                stickCut.rotation.x += deg$rad 22

                for point in [0...standPoints]

                    stand = morph "cut", stand, stickCut

                    stand.rotation.z += deg$rad standAngle

                if standLayers >= 3

                    stickCut.position.z -= standRadius / 2
                    stickCut.position.y -= standRadius * 1.22
                    stickCut.rotation.x += deg$rad 20

                    stand.rotation.z += deg$rad standAngle / 2

                    for point in [0...standPoints]

                        stand = morph "cut", stand, stickCut

                        stand.rotation.z += deg$rad standAngle

        scene.add stand
