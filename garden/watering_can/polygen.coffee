polygen = ->

    segments = 6
    thickness = 3

    topRadius = 35
    middleRadius = 75
    bottomRadius = 45

    topHeight = 110
    bottomHeight = 55

    handleSize = 18
    handleRadius = handleSize / 2

    topDemiRadius = side$angle((360 / (segments * 2)), topRadius, true)
    middleDemiRadius = side$angle((360 / (segments * 2)), middleRadius, true)
    bottomDemiRadius = side$angle((360 / (segments * 2)), bottomRadius, true)

    topDemiSlope = angle$sides(null, (middleDemiRadius - topDemiRadius), topHeight)
    bottomDemiSlope = angle$sides(null, (middleDemiRadius - bottomDemiRadius), bottomHeight)

    handleLength = side$sides topHeight, (middleDemiRadius - topDemiRadius)

    settings.set "ui.title", "low_polygon_watering_can"

    canTop = new Cylinder().setRadialSegments(segments)
    canBottom = new Cylinder().setRadialSegments(segments)

    canTopCut = new Cylinder().setRadialSegments(segments)
    canBottomCut = new Cylinder().setRadialSegments(segments)

    canTop.setLength(topHeight)
    canTop.setPositionZ((topHeight / 2) - satoshi)
    canTop.setPositiveRadius(topRadius)
    canTop.setNegativeRadius(middleRadius)

    canTopCut.setLength(topHeight + nakamoto)
    canTopCut.setPositionZ((topHeight / 2) - satoshi)
    canTopCut.setPositiveRadius(topRadius - thickness)
    canTopCut.setNegativeRadius(middleRadius - thickness)

    canBottom.setLength(bottomHeight)
    canBottom.setPositionZ((-bottomHeight / 2) + satoshi)
    canBottom.setPositiveRadius(middleRadius)
    canBottom.setNegativeRadius(bottomRadius)

    canBottomCut.setLength(bottomHeight - thickness)
    canBottomCut.setPositionZ((-bottomHeight / 2) + (thickness / 2) + nakamoto)
    canBottomCut.setPositiveRadius(middleRadius - thickness)
    canBottomCut.setNegativeRadius(bottomRadius - thickness)

    handleBar = new Cylinder()
    handleBar.setLength(handleLength)
    handleBar.setPositionY(-middleRadius)
    handleBar.setPositionZ(topHeight / 2)
    handleBar.setPositiveRadius(handleRadius)
    handleBar.setNegativeRadius(handleRadius)
    handleBar.setRotationX(deg$rad(topDemiSlope))
    handleBar.setRadialSegments(segments * 10)
    handleBar.setLock(true).add()

    handleTop = new Box()
    handleTop.setWidth(handleSize)
    handleTop.setLength(middleDemiRadius + topDemiRadius)
    handleTop.setHeight(handleRadius)
    handleTop.setPositionY(-middleDemiRadius / 2)
    handleTop.setPositionZ(topHeight - (handleRadius / 2))
    handleTop.setLock(true).add()

    handleBottom = new Box()
    handleBottom.setWidth(handleSize)
    handleBottom.setLength(middleDemiRadius + bottomDemiRadius)
    handleBottom.setHeight(handleRadius)
    handleBottom.setPositionY(-middleDemiRadius + side$angle(bottomDemiSlope, true, null, (handleRadius / 2)))
    handleBottom.setRotationX(deg$rad(-bottomDemiSlope))
    handleBottom.setLock(true).add()

    canTop = morph "cut", canTop, canTopCut
    canBottom = morph "cut", canBottom, canBottomCut

    can = morph "join", canTop, canBottom

    scene.add can
