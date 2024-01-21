polygen = ->

    file = "giraffe_?"

    settings.set "ui.title", file

    giraffe = new Image().setImage("./app/things/art/africa/animals/giraffe/svg/" + file + ".svg").setName(file).add()
