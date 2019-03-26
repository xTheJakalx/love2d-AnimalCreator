sprites = {}

  --animals
  sprites.elephant = love.graphics.newImage('sprites/elephant.png')
  sprites.giraffe = love.graphics.newImage('sprites/giraffe.png')
  sprites.hippo = love.graphics.newImage('sprites/hippo.png')
  sprites.monkey = love.graphics.newImage('sprites/monkey.png')
  sprites.panda = love.graphics.newImage('sprites/panda.png')
  sprites.parrot = love.graphics.newImage('sprites/parrot.png')
  sprites.penguin = love.graphics.newImage('sprites/penguin.png')
  sprites.pig = love.graphics.newImage('sprites/pig.png')
  sprites.rabbit = love.graphics.newImage('sprites/rabbit.png')
  sprites.snake = love.graphics.newImage('sprites/snake.png')

  sprites.font = love.graphics.newImageFont("sprites/imagefont.png",
                                            " abcdefghijklmnopqrstuvwxyz" ..
                                            "ABCDEFGHIJKLMNOPQRSTUVWXYZ0" ..
                                            "123456789.,!?-+/():;%&`'*#=[]\"")
