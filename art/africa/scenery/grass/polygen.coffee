polygen = ->

    scale = 25
    file = "savanna_grass"

    settings.set "ui.title", file

    grass = new Image().setImage("./app/things/art/africa/scenery/grass/svg/" + file + ".svg").setName(file).add()

    grass.setScaleX(scale).setScaleY(scale)
