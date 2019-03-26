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
end

function love.update(dt)
  if buttonTimer > 0 then
    buttonTimer = buttonTimer - 1 * dt
  elseif buttonTimer < .1 then
    spawnAnimal = true
  end
  if spawnAnimal == true then
    checkButton()
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
    if b.text == "Quit" or b.action == "delete" or b.action == "load" or b.action == "save" or b.action == "clear" then
      love.graphics.setColor(1,0.7,1,1)
      love.graphics.rectangle("fill", b.x, b.y, b.width, b.height)
      love.graphics.setColor(1,1,1,1)
      love.graphics.print(b.text, b.x+b.width+5, b.y+b.height, nil, 2, 2, b.width/2, b.height/2)
    else
      love.graphics.setColor(1,0.7,.6,1)
      love.graphics.rectangle("fill", b.x, b.y, b.width, b.height)
      love.graphics.setColor(1,1,1,1)
      love.graphics.print(b.text, b.x+b.width+5, b.y+b.height, nil, 2, 2, b.width/2, b.height/2)
    end
  end
end
