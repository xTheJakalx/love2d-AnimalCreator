local M = {}

local function Draw()
  if debug ~= false then
    love.graphics.rectangle("fill", 10, 10, love.graphics.getWidth()-20, love.graphics.getHeight()-20)
    love.graphics.setColor(0,0.7,0.3,1)
    love.graphics.rectangle("line", 10, 10, love.graphics.getWidth()-20, love.graphics.getHeight()-20)
    love.graphics.setColor(1,1,1,1)

    love.graphics.print("Create Animals", 65, 10, nil, 1.2, 1.2)
    local place = 40
    place = place + 15
    love.graphics.print("Total Animals: " .. #animals, 15, place)
    place = place + 15
    love.graphics.print("Save file exists? ".. (saveFile and 'true' or 'false'), 15, place) -- this is how you print booleans
    place = place + 25
    buttonSpacing = place
    spawnButton(15, buttonSpacing, 155, 30, "Quit", "quit")
    buttonSpacing = buttonSpacing + 35
    spawnButton(15, buttonSpacing, 155, 30, "Delete", "delete")
    buttonSpacing = buttonSpacing + 35
    spawnButton(15, buttonSpacing, 155, 30, "Load", "load")
    buttonSpacing = buttonSpacing + 35
    spawnButton(15, buttonSpacing, 155, 30, "Save", "save")
    buttonSpacing = buttonSpacing + 35
    spawnButton(15, buttonSpacing, 155, 30, "Clear", "clear")
    buttonSpacing = buttonSpacing + 40
    spawnButton(15, buttonSpacing, 155, 36, "Elephant", "elephant")
    buttonSpacing = buttonSpacing + 40
    spawnButton(15, buttonSpacing, 155, 36, "Giraffe", "giraffe")
    buttonSpacing = buttonSpacing + 40
    spawnButton(15, buttonSpacing, 155, 36, "Hippo", "hippo")
    buttonSpacing = buttonSpacing + 40
    spawnButton(15, buttonSpacing, 155, 36, "Monkey", "monkey")
    buttonSpacing = buttonSpacing + 40
    spawnButton(15, buttonSpacing, 155, 36, "Panda", "panda")
    buttonSpacing = buttonSpacing + 40
    spawnButton(15, buttonSpacing, 155, 36, "Parrot", "parrot")
    buttonSpacing = buttonSpacing + 40
    spawnButton(15, buttonSpacing, 155, 36, "Penguin", "penguin")
    buttonSpacing = buttonSpacing + 40
    spawnButton(15, buttonSpacing, 155, 36, "Pig", "pig")
    buttonSpacing = buttonSpacing + 40
    spawnButton(15, buttonSpacing, 155, 36, "Rabbit", "rabbit")
    buttonSpacing = buttonSpacing + 40
    spawnButton(15, buttonSpacing, 155, 36, "Snake", "snake")
    place = place + 20
    local animalNum = 1
    place = place + 15
    -- place will be row
    local column = 350
    local columnNum = 1
    for i,a in ipairs(animals) do
      if columnNum > 4 then
        columnNum = 1
        place = place + 85
        column = 350
      end
      columnNum = columnNum + 1
      column = column + 95
      love.graphics.draw(a.sprite, column, place, nil, .25, .25, a.sprite:getWidth()/2, a.sprite:getHeight()/2)
    end
    love.graphics.print("Table of Animals".. " - Total Animals: ".. #animals, 450,20)
    love.graphics.print(table.show(animals, "animals"), 750,40)
  end
end

function M.drawDebug()
  Draw()
end

return M
