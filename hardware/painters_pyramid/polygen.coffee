polygen = ->

    thickness = 8

    tabGap = 0.1
    halfTabGap = tabGap / 2
    tabSize = thickness / 2
    tabHeight = tabSize / 2

    tetrahedron = new Cone().setRadialSegments 3
    tetrahedronCut = new Cone().setRadialSegments 3

    tetrahedronRadius = 30
    tetrahedronSideLength = side$angle(30, tetrahedronRadius, true) * 2
    tetrahedronHeight = side$sides(tetrahedronRadius, null, tetrahedronSideLength)

    tetrahedronCutRadius = tetrahedronRadius - thickness
    tetrahedronCutSideLength = side$angle(30, tetrahedronCutRadius, true) * 2
    tetrahedronCutHeight = side$sides(tetrahedronCutRadius, null, tetrahedronCutSideLength)

    tetrahedron.setRadius(tetrahedronRadius).setHeight(tetrahedronHeight)
    tetrahedronCut.setRadius(tetrahedronCutRadius).setHeight(tetrahedronCutHeight)

    heightDiff = tetrahedronHeight - tetrahedronCutHeight
    slope = 90 - angle$sides(null, tetrahedronHeight - tetrahedronRadius, tetrahedronHeight)

    tetrahedronCutX = side$angle(slope, -heightDiff / 2, true, null)
    tetrahedronCutZ = side$angle(slope, -heightDiff / 2, null, true)

    tabX = side$angle 30, tetrahedronRadius, null, true
    tabZ = (-tetrahedronHeight / 2) + (tabHeight / 2) - satoshi

    tabBoxCut = new Box().setWidth(tabSize).setLength(tabSize).setHeight(tabHeight).setPositionZ(tabZ)
    tabBox = new Box().setWidth(tabSize - tabGap).setLength(tabSize - tabGap).setHeight(tabHeight).setPositionZ(tabZ)

    tabEndCut = new Cylinder().setLength(tabHeight).setPositiveRadius(tabSize / 2).setNegativeRadius(tabSize / 2)
    tabEndCut.setPositionZ(tabZ).setPositionX(tabSize / 2).setRadialSegments(44)

    tabEnd = new Cylinder().setLength(tabHeight).setPositiveRadius((tabSize / 2) - halfTabGap).setNegativeRadius((tabSize / 2) - halfTabGap)
    tabEnd.setPositionZ(tabZ).setPositionX((tabSize / 2) - halfTabGap).setRadialSegments(44)

    tabHoleCut =  new Cylinder().setLength(tabHeight + nakamoto).setPositiveRadius(tabSize / 4).setNegativeRadius(tabSize / 4)
    tabHoleCut.setPositionZ(tabZ).setPositionX(tabSize / 2)

    tabHole =  new Cylinder().setLength(tabHeight + nakamoto).setPositiveRadius((tabSize / 4) + halfTabGap).setNegativeRadius((tabSize / 4) + halfTabGap)
    tabHole.setPositionZ(tabZ).setPositionX((tabSize / 2))

    tetrahedronCut.setPositionZ(-heightDiff / 2 - satoshi)

    tetrahedron = morph "cut", tetrahedron, tetrahedronCut

    tetrahedronCut.setPositionX(tetrahedronCutX)
    tetrahedronCut.setPositionZ(tetrahedronCutZ)

    tabCut = morph "join", tabBoxCut, tabEndCut
    tabCut = morph "cut", tabCut, tabHoleCut

    tab = morph "join", tabBox, tabEnd
    tab = morph "cut", tab, tabHole

    tab.rotation.z = deg$rad 180

    tabCut.position.x = -tabX
    tab.position.x = -tabX

    tetrahedron = morph "cut", tetrahedron, tetrahedronCut

    tetrahedron.rotation.z = deg$rad 120

    tetrahedron = morph "cut", tetrahedron, tetrahedronCut
    tetrahedron = morph "cut", tetrahedron, tabCut

    tetrahedron.rotation.z = deg$rad 120

    tetrahedron = morph "cut", tetrahedron, tetrahedronCut
    tetrahedron = morph "join", tetrahedron, tab

    settings.set "ui.title", "painters_tetrahedron"

    scene.add tetrahedron
