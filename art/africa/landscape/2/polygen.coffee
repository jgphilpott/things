polygen = ->

    zScale = 85
    treeScale = 25
    grassScale = 25
    impalaScale = 12

    treeFile = "tree_4"
    grassFile = "savanna_grass"
    impalaFile = "impala_6"

    settings.set "ui.title", "landscape_2"

    tree = new Image().setImage("./app/things/art/africa/scenery/trees/svg/" + treeFile + ".svg").setName(null, "tree").add()
    grass = new Image().setImage("./app/things/art/africa/scenery/grass/svg/" + grassFile + ".svg").setName(null, "grass").add()
    impala = new Image().setImage("./app/things/art/africa/animals/impala/svg/" + impalaFile + ".svg").setName(null, "impala").add()

    tree.setScaleX(treeScale).setScaleY(treeScale).setScaleZ(zScale)
    grass.setScaleX(grassScale).setScaleY(grassScale).setScaleZ(zScale)
    impala.setScaleX(impalaScale).setScaleY(impalaScale).setScaleZ(zScale)

    tree.setPositionX(5).setPositionY(-54)
    impala.setPositionX(-54).setPositionY(-22)

    tree.setLock true
    grass.setLock true
    impala.setLock true
