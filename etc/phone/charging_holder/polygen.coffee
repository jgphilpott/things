polygen = =>

    thickness = 2.5

    phoneWidth = 85
    phoneHeight = 170
    phoneThickness = 15

    chargingHoleWidth = 20
    chargingHoleHeight = 250
    chargingHoleThickness = 10

    settings.set "ui.title", "Phone_Charging_Holder"

    phone = new Box()

    holderBase = new Box()
    holderBack = new Box()

    chargingHole = new Box()

    frontHolderHeader = new Cylinder()
    backHolderHeader = new Cylinder()

    sideHolderCutter = new Cylinder()

    phone.setWidth(phoneWidth)
    phone.setHeight(phoneHeight)
    phone.setLength(phoneThickness)

    holderBase.setWidth(phoneWidth + (thickness * 2))
    holderBase.setHeight((phoneHeight / 3) + thickness)
    holderBase.setLength(phoneThickness + (thickness * 2))

    holderBase.setPositionZ(-((phoneHeight / 3) + (thickness / 2)))

    holderBack.setWidth(phoneWidth + (thickness * 2))
    holderBack.setHeight((phoneHeight / 6) + thickness)
    holderBack.setLength(thickness)

    holderBack.setPositionY(-((phoneThickness / 2) + (thickness / 2)))
    holderBack.setPositionZ(-((phoneHeight / 12) + (thickness / 2)))

    chargingHole.setWidth(chargingHoleWidth)
    chargingHole.setHeight(chargingHoleHeight)
    chargingHole.setLength(chargingHoleThickness)

    frontHolderHeader.setRotationX(0)
    frontHolderHeader.setLength(thickness)

    frontHolderHeader.setPositiveRadius((phoneWidth / 2) + thickness)
    frontHolderHeader.setNegativeRadius((phoneWidth / 2) + thickness)

    frontHolderHeader.setPositionZ(-((phoneHeight / 6)))
    frontHolderHeader.setPositionY((phoneThickness / 2) + (thickness / 2))

    backHolderHeader.setRotationX(0)
    backHolderHeader.setLength(thickness)

    backHolderHeader.setPositiveRadius((phoneWidth / 2) + thickness)
    backHolderHeader.setNegativeRadius((phoneWidth / 2) + thickness)

    backHolderHeader.setPositionY(-((phoneThickness / 2) + (thickness / 2)))

    sideHolderCutter.setRotationX(0)
    sideHolderCutter.setRotationY(0)
    sideHolderCutter.setRotationZ(deg$rad(90))

    sideHolderCutter.setRadialSegments(40)
    sideHolderCutter.setPositiveRadius(phoneThickness / 2)
    sideHolderCutter.setNegativeRadius(phoneThickness / 2)

    sideHolderCutter.setLength(phoneWidth + (thickness * 3))

    sideHolderCutter.setPositionZ(-((phoneHeight / 6)))

    holderBase = morph "cut", holderBase, phone
    holderBase = morph "cut", holderBase, chargingHole
    holderBase = morph "cut", holderBase, sideHolderCutter

    scene.add holderBase
    scene.add holderBack

    scene.add backHolderHeader
    scene.add frontHolderHeader
