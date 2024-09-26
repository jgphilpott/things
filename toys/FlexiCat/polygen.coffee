polygen = (size = "Long") => # 'Short' or 'Long'

    settings.set "ui.title", "FlexiCat" + size + "Keychain"

    keychain = new Torus(radius: 12.5, thickness: 1.75).add()

    keychain.rotateY(deg$rad 90).setPositionZ(22).setPositionX(-20)

    importer.importFile "OBJ", "./app/things/toys/FlexiCat/files/FlexiCat" + size + ".obj"

    # Then do maunal CSG.
