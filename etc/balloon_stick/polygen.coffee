polygen = (item = "holder") -> # Item should = 'holder' or 'stick'.

    slotCount = 3
    slotWidth = 3
    slotAngle = 360 / slotCount

    stickRadius = 2.5
    stickHeight = 300
    stickThickness = 1

    holderRadius = 16.5
    holderHeight = 16.5
    holderThickness = 1.5

    holder = new Cone().setHeight(holderHeight).setRadius(holderRadius)
    holderCut = new Cone().setHeight(holderHeight).setRadius(holderRadius).setPositionZ(-holderThickness)

    stick = new Cylinder().setPositiveRadius(stickRadius).setNegativeRadius(stickRadius).setLength(stickHeight)
    stickCut = new Cylinder().setPositiveRadius(stickRadius - stickThickness).setNegativeRadius(stickRadius - stickThickness).setLength(stickHeight + stickThickness)

    holderTop = new Cylinder().setPositiveRadius(stickRadius + holderThickness).setNegativeRadius(stickRadius + holderThickness)
    holderTop.setLength(holderHeight / 2).setPositionZ(holderHeight / 2)

    holderTopCut = new Cylinder().setPositiveRadius(stickRadius).setNegativeRadius(stickRadius)
    holderTopCut.setLength(holderHeight / 2).setPositionZ((holderHeight / 2) + holderThickness)

    slotEnd = new Cylinder().setPositiveRadius(slotWidth).setNegativeRadius(slotWidth).setLength(holderHeight)
    slotEnd.setPositionY(holderRadius / 2).setRotationX(deg$rad(45))

    slotBox = new Box().setWidth(slotWidth).setLength(holderRadius).setHeight(holderHeight).setPositionY(holderRadius)

    if item is "holder"

        settings.set "ui.title", "balloon_holder (" + slotCount + " slots)"

        holderTop = morph "cut", holderTop, holderTopCut
        holder = morph "cut", holder, holderCut

        for slot in [0...slotCount]

            holder = morph "cut", holder, slotEnd
            holder = morph "cut", holder, slotBox

            holder.rotation.z += deg$rad slotAngle

        holder = morph "cut", holder, holderTopCut
        holder = morph "join", holder, holderTop

        scene.add holder

    else if item is "stick"

        settings.set "ui.title", "balloon_stick"

        stick = morph "cut", stick, stickCut

        scene.add stick
