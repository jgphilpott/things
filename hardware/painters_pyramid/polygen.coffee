polygen = ->

    thickness = 2

    tetrahedron = new Cone().setRadialSegments(3)
    tetrahedronCut = new Cone().setRadialSegments(3)

    tetrahedronRadius = 7
    tetrahedronSideLength = side$angle(30, tetrahedronRadius, true) * 2
    tetrahedronHeight = side$sides(tetrahedronRadius, null, tetrahedronSideLength)

    tetrahedronCutRadius = tetrahedronRadius - thickness
    tetrahedronCutSideLength = side$angle(30, tetrahedronCutRadius, true) * 2
    tetrahedronCutHeight = side$sides(tetrahedronCutRadius, null, tetrahedronCutSideLength)

    tetrahedron.setRadius(tetrahedronRadius).setHeight(tetrahedronHeight)
    tetrahedronCut.setRadius(tetrahedronCutRadius).setHeight(tetrahedronCutHeight)

    heightDiff = tetrahedronHeight - tetrahedronCutHeight
    slope = 90 - angle$sides(null, tetrahedronHeight - tetrahedronRadius, tetrahedronHeight)

    x = side$angle(slope, -heightDiff / Math.PI, true, null)
    z = side$angle(slope, -heightDiff / Math.PI, null, true)

    tetrahedronCut.setPositionZ(-heightDiff / 2 - satoshi)

    tetrahedron = morph "cut", tetrahedron, tetrahedronCut

    tetrahedronCut.setPositionX(x).setPositionZ(z)

    tetrahedron = morph "cut", tetrahedron, tetrahedronCut
    tetrahedron.rotation.z = deg$rad 120
    tetrahedron = morph "cut", tetrahedron, tetrahedronCut
    tetrahedron.rotation.z = deg$rad 120
    tetrahedron = morph "cut", tetrahedron, tetrahedronCut

    settings.set "ui.title", "painters_tetrahedron"

    scene.add tetrahedron
