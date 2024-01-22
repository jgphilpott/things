polygen = ->

    file = "tree_?"

    settings.set "ui.title", file

    tree = new Image().setImage("./app/things/art/africa/scenery/trees/svg/" + file + ".svg").setName(file).add()
