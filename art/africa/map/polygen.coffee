polygen = ->

    file = "silhouette_?"

    settings.set "ui.title", file

    map = new Image().setImage("./app/things/art/africa/map/svg/" + file + ".svg").setName(file).add()
