function love.load()
  love.window.setMode(1200, 700)
  myWorld = love.physics.newWorld(0, 0, false)

  love.graphics.setColor(1, 1, 5, 1)
  animals = {}
  buttons = {}
  require('button')
  animal = require('animal')
  require('sprites')
  love.graphics.setFont(sprites.font)
  require('show')
  mod = dofile('debug.lua')

  buttonTimer = 0
  spawnAnimal = false
  saveFile = false
  --this was in the draw function before and was constantly creating buttons (doh!)
  buttonSpacing = 95
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
end

function love.update(dt)
  if buttonTimer > 0 then
    buttonTimer = buttonTimer - 1 * dt
  elseif buttonTimer < .1 then
    spawnAnimal = true
  end

    if love.filesystem.getInfo("data.lua") then
      saveFile = true
    else
      saveFile = false
    end
end

function love.draw()
  mod.drawDebug()
  for i,b in ipairs(buttons) do
    -- set colour for save/load/delete/quit/clear buttons
    if b.action == "quit" or b.action == "delete" or b.action == "load" or b.action == "save" or b.action == "clear" then
      love.graphics.setColor(1,0.7,1,1)
      love.graphics.rectangle("fill", b.x, b.y, b.width, b.height)
      love.graphics.setColor(1,1,1,1)
      love.graphics.print(b.text, b.x+b.width+5, b.y+b.height, nil, 2, 2, b.width/2, b.height/2)
    else
      -- set colour for animal buttons
      love.graphics.setColor(1,0.7,.6,1)
      love.graphics.rectangle("fill", b.x, b.y, b.width, b.height)
      love.graphics.setColor(1,1,1,1)
      love.graphics.print(b.text, b.x+b.width+5, b.y+b.height, nil, 2, 2, b.width/2, b.height/2)
    end
  end
end
