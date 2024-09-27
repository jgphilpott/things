polygen = (size = "Long") => # 'Short' or 'Long'

    settings.set "ui.title", "FlexiCat" + size + "Keychain"

    keychain = new Torus(radius: 12.5, thickness: 1.75).add()

    keychain.rotateY(deg$rad 125).setPositionZ(21).setPositionX(-14)

    importer.importFile "OBJ", "./app/things/toys/FlexiCat/files/FlexiCat" + size + ".obj"

    # Then do maunal CSG.
