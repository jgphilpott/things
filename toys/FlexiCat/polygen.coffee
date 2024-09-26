polygen = (size = "Long") => # 'Short' or 'Long'

    keychain = new Torus(radius: 12.5, thickness: 1.55).add()

    keychain.rotateY(deg$rad 90).setPositionZ(23.5).setPositionX(-20)

    importer.importFile "OBJ", "./app/things/toys/FlexiCat/files/FlexiCat" + size + ".obj"

    # Then do maunal CSG.
