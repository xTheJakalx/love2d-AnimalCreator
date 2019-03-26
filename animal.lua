local animal = {}

function animal:new(x,y,sprite,name)
  local body = love.physics.newBody(myWorld, x, y, "dynamic")
  local shape = love.physics.newRectangleShape(10,10)
  newObj = {
    body = body,
    shape = shape,
    fixture = love.physics.newFixture(body, shape),
    x = x,
    y = y,
    sprite = sprite,
    name = name
    }
  self.__index = self
  table.insert(animals,newObj)
  return setmetatable(newObj, self)
end


function animal:load()
  if love.filesystem.getInfo("data.lua") then
    local data = love.filesystem.load("data.lua")
    data()
  end
  -- sprite is comming back as a string (im not sure why) but this is a HACK workaround
  for i,a in ipairs(animals) do
    if a.name == "elephant" then a.sprite = sprites.elephant end
    if a.name == "giraffe" then a.sprite = sprites.giraffe end
    if a.name == "hippo" then a.sprite = sprites.hippo end
    if a.name == "monkey" then a.sprite = sprites.monkey end
    if a.name == "panda" then a.sprite = sprites.panda end
    if a.name == "parrot" then a.sprite = sprites.parrot end
    if a.name == "penguin" then a.sprite = sprites.penguin end
    if a.name == "pig" then a.sprite = sprites.pig end
    if a.name == "rabbit" then a.sprite = sprites.rabbit end
    if a.name == "snake" then a.sprite = sprites.snake end
  end
end

function animal:save()
  love.filesystem.write("data.lua", table.show(animals, "animals"))
end


return animal
