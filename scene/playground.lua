local playground = {}

function playground:init()
  love.physics.setMeter(64)
  world = love.physics.newWorld(0, 15.81*64, true)
  love.graphics.setBackgroundColor(210, 222, 227)

  objects                 = {}
  objects.ground          = { w = 800, h = 96 }
  objects.ground.body     = love.physics.newBody(world, 800/2, 600 - (objects.ground.h/2))
  objects.ground.shape    = love.physics.newRectangleShape(objects.ground.w, objects.ground.h)
  objects.ground.fixture  = love.physics.newFixture(objects.ground.body, objects.ground.shape)

  objects.box1          = {w = 800, h = 96}
  objects.box1.body     = love.physics.newBody(world, 800/2, 600 - (objects.ground.h/2))
  objects.box1.shape    = love.physics.newRectangleShape(objects.ground.w, objects.ground.h)
  objects.box1.fixture  = love.physics.newFixture(objects.ground.body, objects.ground.shape)
end

function playground:draw()
  love.graphics.setColor(68, 68, 68)
  love.graphics.polygon("fill", objects.ground.body:getWorldPoints(objects.ground.shape:getPoints()))
end

return playground