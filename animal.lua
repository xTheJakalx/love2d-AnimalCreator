-- some explanations taken from Learn lua in 15 minutes - http://tylerneylon.com/a/learn-lua/
-- as that is where i learned how to do these things :)

local animal = {}
--    function tablename:fn(...) is the same as
--    function tablename.fn(self, ...)
--    The : just adds a first arg called self
function animal:new(x,y,sprite,name)
  newObj = {}
  newObj.body = love.physics.newBody(myWorld, x, y, "dynamic")
  newObj.shape = love.physics.newRectangleShape(10,10)
  newObj.fixture = love.physics.newFixture(newObj.body, newObj.shape)
  newObj.x = x
  newObj.y = y
  newObj.sprite = sprite
  newObj.name = name
  --[[
  --    self = the class being instantiated. Often
  --    self = animal, but inheritance can change it.
  --    newObj gets self's functions when we set both
  --    newObj's metatable and self's __index to self
  ]]
  self.__index = self
  -- adding this table(object) to animals during the creation process
  table.insert(animals,newObj)
  return setmetatable(newObj, self)
end


function animal:save()
  --[[
  the show.lua file serializes the table structure and saves it as a lua file (in this case its data.lua)

  love.filesystem.write("nameOfSaveFile", table.show(nameOfCurrentTable, nameToSaveTableAs))

  in windows love defaults file locations to %app_data%/roaming/love/%game_folder%
  in linux love defaults file locations to {user home directory}/.local/share/love/%game_folder%
  ]]
  love.filesystem.write("data.lua", table.show(animals, "animals"))
end

function animal:load()
  -- check to see if the data file exists then loads it if it does
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

return animal
