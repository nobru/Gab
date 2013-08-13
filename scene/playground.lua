local playground = {}

function playground:init()
  love.physics.setMeter(64)
  world = love.physics.newWorld(0, 15.81*64, true)
  love.graphics.setBackgroundColor(210, 222, 227)

  objects                 = {}
  objects.ground          = { w = love.graphics.getWidth(), h = 96 }
  objects.ground.body     = love.physics.newBody(world, love.graphics.getWidth()/2, love.graphics.getHeight() - (objects.ground.h/2))
  objects.ground.shape    = love.physics.newRectangleShape(objects.ground.w, objects.ground.h)
  objects.ground.fixture  = love.physics.newFixture(objects.ground.body, objects.ground.shape)
end

function playground:draw()
  love.graphics.setColor(68, 68, 68)
  love.graphics.polygon("fill", objects.ground.body:getWorldPoints(objects.ground.shape:getPoints()))
end

return playground