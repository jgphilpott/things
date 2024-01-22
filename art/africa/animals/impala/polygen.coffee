polygen = ->

    file = "impala_?"

    settings.set "ui.title", file

    impala = new Image().setImage("./app/things/art/africa/animals/impala/svg/" + file + ".svg").setName(file).add()
