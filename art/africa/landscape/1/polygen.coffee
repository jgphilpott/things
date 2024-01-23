polygen = ->

    zScale = 85
    treeScale = 30
    grassScale = 25
    giraffeScale = 42

    treeFile = "tree_5"
    grassFile = "savanna_grass"
    giraffeFile = "giraffe_2"

    settings.set "ui.title", "landscape_1"

    tree = new Image().setImage("./app/things/art/africa/scenery/trees/svg/" + treeFile + ".svg").setName(null, "tree").add()
    grass = new Image().setImage("./app/things/art/africa/scenery/grass/svg/" + grassFile + ".svg").setName(null, "grass").add()
    giraffe = new Image().setImage("./app/things/art/africa/animals/giraffe/svg/" + giraffeFile + ".svg").setName(null, "giraffe").add()

    tree.setScaleX(treeScale).setScaleY(treeScale).setScaleZ(zScale)
    grass.setScaleX(grassScale).setScaleY(grassScale).setScaleZ(zScale)
    giraffe.setScaleX(giraffeScale).setScaleY(giraffeScale).setScaleZ(zScale)

    tree.setPositionX(-17).setPositionY(-75)
    giraffe.setPositionX(44).setPositionY(-38)

    tree.setLock true
    grass.setLock true
    giraffe.setLock true
