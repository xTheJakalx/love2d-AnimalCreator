local D = {}
-- local function that cant run directly from outside this class
local function Draw()
  -- check if debug is true or false
  if debug ~= false then
    love.graphics.rectangle("fill", 10, 10, love.graphics.getWidth()-20, love.graphics.getHeight()-20)
    love.graphics.setColor(0,0.7,0.3,1)
    love.graphics.rectangle("line", 10, 10, love.graphics.getWidth()-20, love.graphics.getHeight()-20)
    love.graphics.setColor(1,1,1,1)

    love.graphics.print("Create Animals", 65, 10, nil, 1.2, 1.2)
    local yPos = 40
    yPos = yPos + 15
    love.graphics.print("Total Animals: " .. #animals, 15, yPos)
    yPos = yPos + 15
    love.graphics.print("Save file exists? ".. (saveFile and 'true' or 'false'), 15, yPos) -- this is how you print booleans
    yPos = yPos + 25
    buttonSpacing = yPos
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
    yPos = yPos + 20
    local animalNum = 1
    yPos = yPos + 15
    -- place will be row
    local xPos = 350 -- where to start drawing the animal icons on the x axis
    local columnNum = 1 -- which column to draw the icon to
    for i,a in ipairs(animals) do
       -- if more than 4 columns return to column 1
      if columnNum > 4 then
        columnNum = 1
        yPos = yPos + 85
        xPos = 350
      end
      -- move over to the next column
      columnNum = columnNum + 1
      -- add 95 pixels to column position (x)
      xPos = xPos + 95
      love.graphics.draw(a.sprite, xPos, yPos, nil, .25, .25, a.sprite:getWidth()/2, a.sprite:getHeight()/2)
    end
    love.graphics.print("Table of Animals".. " - Total Animals: ".. #animals, 450,20)
    love.graphics.print(table.show(animals, "animals"), 750,40)
  end
end

-- above function is local so we need this function to be able to run it outside this file
function D.drawDebug()
  Draw()
end

return D
