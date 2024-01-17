polygen = ->

    file = "monkey_?"

    settings.set "ui.title", file

    monkey = new Image().setImage("./app/things/art/africa/animals/monkey/svg/" + file + ".svg").setName(file).add()
