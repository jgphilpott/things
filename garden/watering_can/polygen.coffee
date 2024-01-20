polygen = =>

    segments = 6
    thickness = 2

    topRadius = 30
    middleRadius = 75
    bottomRadius = 42

    topHeight = 115
    bottomHeight = 50

    name = "low_polygon_watering_can"
    settings.set "ui.title", name

    canTop = new Cylinder().setRotationY(0).setRadialSegments(segments)
    canBottom = new Cylinder().setRotationY(0).setRadialSegments(segments)

    canTopCut = new Cylinder().setRotationY(0).setRadialSegments(segments)
    canBottomCut = new Cylinder().setRotationY(0).setRadialSegments(segments)

    canTop.setLength(topHeight)
    canTop.setPositionZ((topHeight / 2) - satoshi)
    canTop.setPositiveRadius(topRadius + (thickness * 2))
    canTop.setNegativeRadius(middleRadius + (thickness * 2))

    canTopCut.setLength(topHeight + nakamoto)
    canTopCut.setPositionZ((topHeight / 2) - satoshi)
    canTopCut.setPositiveRadius(topRadius)
    canTopCut.setNegativeRadius(middleRadius)

    canBottom.setLength(bottomHeight)
    canBottom.setPositionZ(-(bottomHeight / 2) + satoshi)
    canBottom.setPositiveRadius(middleRadius + (thickness * 2))
    canBottom.setNegativeRadius(bottomRadius + (thickness * 2))

    canBottomCut.setLength(bottomHeight - thickness)
    canBottomCut.setPositionZ(-(bottomHeight / 2) + nakamoto + (thickness / 2))
    canBottomCut.setPositiveRadius(middleRadius)
    canBottomCut.setNegativeRadius(bottomRadius)

    canTop = morph "cut", canTop, canTopCut
    canBottom = morph "cut", canBottom, canBottomCut
    can = morph "join", canTop, canBottom

    scene.add can
