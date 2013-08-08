gab = require '..gabriel'

local playground = {}

function playground:init()
  love.physics.setMeter(64)
  world = love.physics.newWorld(0, 9.81*64, true)
  love.graphics.setBackgroundColor(210, 222, 227)

  objects                 = {}
  objects.ground          = {w = 800, h = 96}
  objects.ground.body     = love.physics.newBody(world, 800/2, 600 - (objects.ground.h/2))
  objects.ground.shape    = love.physics.newRectangleShape(objects.ground.w, objects.ground.h)
  objects.ground.fixture  = love.physics.newFixture(objects.ground.body, objects.ground.shape)

  gab.body    = love.physics.newBody(world, 10, 600 - objects.ground.h - gab.h, "dynamic")
  gab.x       = gab.body:getX()
  gab.y       = gab.body:getY()
  gab.shape   = love.physics.newRectangleShape(0, gab.h/2, gab.w, gab.h)
  gab.fixture = love.physics.newFixture(gabriel.body, gabriel.shape, 1)
end

function playground:draw()
  love.graphics.setColor(68, 68, 68)
  love.graphics.polygon("fill", objects.ground.body:getWorldPoints(objects.ground.shape:getPoints()))
  gab:draw()
end

function playground:update(dt)
  world:update(dt)
  gab.update()
end

return playground