polygen = ->

    file = "elephants_in_a_row_?"

    settings.set "ui.title", file

    elephant = new Image().setImage("./app/things/art/africa/animals/elephant/svg/" + file + ".svg").setName(file).add()
