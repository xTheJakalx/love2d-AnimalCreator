buttons = {}

-- spawn a button with text string for display name on top of button and string for action name (so you can check against this later for certain actions)
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
  --this was left in but if you set this false you could later go through all buttons and remove all false ones
  button.active = true

  table.insert(buttons, button)
end

function love.mousereleased(x, y, button, isTouch)
  if button == 1 and spawnAnimal == true then
    for i,b in pairs(buttons) do
      -- check if clicking inside the button x and y limits
      if love.mouse:getX() >= b.x and love.mouse:getY() >= b.y and love.mouse:getX() < b.x2 and love.mouse:getY() < b.y2 then
        -- sending action string to clickbutton function to find action to use
        clickButton(b.action)
        spawnAnimal = false
      end
    end
  end
end

function clickButton(action)
  -- check if we are able to click the button and if there are less than 24 animals (the limit i chose based on screen space)
  if spawnAnimal == true and #animals < 24 then
    -- different buttons for spawning the animal objects
    if action == "elephant" then
      animal:new(0,0,sprites.elephant, "elephant")
    end
    if action == "giraffe" then
      animal:new(0,0,sprites.giraffe, "giraffe")
    end
    if action == "hippo" then
      animal:new(0,0,sprites.hippo, "hippo")
    end
    if action == "monkey" then
      animal:new(0,0,sprites.monkey, "monkey")
    end
    if action == "panda" then
      animal:new(0,0,sprites.panda, "panda")
    end
    if action == "parrot" then
      animal:new(0,0,sprites.parrot, "parrot")
    end
    if action == "penguin" then
      animal:new(0,0,sprites.penguin, "penguin")
    end
    if action == "pig" then
      animal:new(0,0,sprites.pig, "pig")
    end
    if action == "rabbit" then
      animal:new(0,0,sprites.rabbit, "rabbit")
    end
    if action == "snake" then
      animal:new(0,0,sprites.snake, "snake")
    end
  end
    -- buttons for load,save,clear,delete and quit actions
    if action == "load" then
      animal:load()
    end
    if action == "save" then
      animal:save()
    end
    if action == "clear" then
      -- removes the animals from memory by removing them from the animal table
      if #animals > 0 then
        for i=#animals,1,-1 do
          table.remove(animals, i)
        end
      end
    end
    -- if save file exists delete it
    if action == "delete" then
      if love.filesystem.getInfo("data.lua") then
        love.filesystem.remove("data.lua")
      end
    end
    if action == "quit" then
      love.event.quit()
    end
end

-- these are used to remove a button if button.active is set false
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
--     table.remove(buttons, i)
--   end
-- end
