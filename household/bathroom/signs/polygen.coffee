polygen = (type = "toilet") -> # Type should = 'toilet', 'shower' or 'sink'.

    iconDepth = 5
    iconScale = 20

    signRadius = 100
    signThickness = 3

    if type is "toilet"

        iconScale = 25

    settings.set "ui.title", type + "_sign"

    icon = new Image().setImage("./app/things/household/bathroom/signs/svg/" + type + ".svg").setScaleX(iconScale).setScaleY(iconScale).setDepth(iconDepth).add()

    sign = new Cylinder().setPositiveRadius(signRadius).setNegativeRadius(signRadius).setLength(signThickness).add()

    if type is "shower" then icon.setPositionX(0).setPositionY(-10)

    # Then do maunal CSG.
