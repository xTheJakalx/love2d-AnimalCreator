buttons = {}

function spawnButton(x, y, width, height, text, action)
  local button = {}
  button.x = x
  button.y = y
  button.width = width
  button.height = height
  button.x2 = x + width
  button.y2 = y + height
  button.action = action
  button.text = text
  button.active = true

  table.insert(buttons, button)
end

function love.mousereleased(x, y, button, isTouch)
  if button == 1 and spawnAnimal == true then
    for i,b in pairs(buttons) do
      if love.mouse:getX() >= b.x and love.mouse:getY() >= b.y and love.mouse:getX() < b.x2 and love.mouse:getY() < b.y2 then
        clickButton(b.action)
        spawnAnimal = false
      end
    end
  end
end
function checkButton()
end

function clickButton(button)
  if spawnAnimal == true and #animals < 24 then
    if button == "elephant" then
      animal:new(0,0,sprites.elephant, "elephant")
    end
    if button == "giraffe" then
      animal:new(0,0,sprites.giraffe, "giraffe")
    end
    if button == "hippo" then
      animal:new(0,0,sprites.hippo, "hippo")
    end
    if button == "monkey" then
      animal:new(0,0,sprites.monkey, "monkey")
    end
    if button == "panda" then
      animal:new(0,0,sprites.panda, "panda")
    end
    if button == "parrot" then
      animal:new(0,0,sprites.parrot, "parrot")
    end
    if button == "penguin" then
      animal:new(0,0,sprites.penguin, "penguin")
    end
    if button == "pig" then
      animal:new(0,0,sprites.pig, "pig")
    end
    if button == "rabbit" then
      animal:new(0,0,sprites.rabbit, "rabbit")
    end
    if button == "snake" then
      animal:new(0,0,sprites.snake, "snake")
    end
    if button == "load" then
      animal:load()
    end
    if button == "save" then
      animal:save()
    end
    if button == "clear" then
      if #animals > 0 then
        for i=#animals,1,-1 do
          table.remove(animals, i)
        end
      end
    end
    if button == "delete" then
      if love.filesystem.getInfo("data.lua") then
        love.filesystem.remove("data.lua")
      end
    end
    if button == "quit" then
      love.event.quit()
    end
  end
end

-- these are used to remove a button if it is flagged inactive
-- and to remove all buttons - i left them in incase you wanted to use this functionality

-- function buttonUpdate(dt)
--   for i=#buttons,1,-1 do
--     local b = buttons[i]
--     if b.active == false then
--       table.remove(buttons, i)
--     end
--   end
-- end
--
-- function removeButtons(dt)
--   for i=#buttons,1,-1 do
--     local b = buttons[i]
--     table.remove(buttons, i)
--   end
-- end
