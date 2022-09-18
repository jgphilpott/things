polygen = (thickness = 10) ->

    data.title = "Flexing Test (" + thickness + " mm)"

    box5 = newBox 50, thickness, thickness, [0, - 30, 0]
    box10 = newBox 100, thickness, thickness, [0, - 10, 0]
    box15 = newBox 150, thickness, thickness, [0, 10, 0]
    box20 = newBox 200, thickness, thickness, [0, 30, 0]

    data.scene.add box5
    data.scene.add box10
    data.scene.add box15
    data.scene.add box20