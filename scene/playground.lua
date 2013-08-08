gab = require '..gabriel'

local playground = {}

function playground:init()
  love.physics.setMeter(64)
  world = love.physics.newWorld(0, 15.81*64, true)
  love.graphics.setBackgroundColor(210, 222, 227)

  objects                 = {}
  objects.ground          = {w = 800, h = 96}
  objects.ground.body     = love.physics.newBody(world, 800/2, 600 - (objects.ground.h/2))
  objects.ground.shape    = love.physics.newRectangleShape(objects.ground.w, objects.ground.h)
  objects.ground.fixture  = love.physics.newFixture(objects.ground.body, objects.ground.shape)

  objects.wallL          = {w = 10, h = 600}
  objects.wallL.body     = love.physics.newBody(world, objects.wallL.w/2, objects.wallL.h/2)
  objects.wallL.shape    = love.physics.newRectangleShape(0, 0, objects.wallL.w, objects.wallL.h)
  objects.wallL.fixture  = love.physics.newFixture(objects.wallL.body, objects.wallL.shape)

  objects.wallR          = {w = 10, h = 600}
  objects.wallR.body     = love.physics.newBody(world, objects.wallL.w/2, objects.wallL.h/2)
  objects.wallR.shape    = love.physics.newRectangleShape(
    objects.ground.w-objects.wallR.w, 0, objects.wallR.w, objects.wallR.h
  )
  objects.wallR.fixture  = love.physics.newFixture(objects.wallR.body, objects.wallR.shape)

  objects.box1          = {w = 800, h = 96}
  objects.box1.body     = love.physics.newBody(world, 800/2, 600 - (objects.ground.h/2))
  objects.box1.shape    = love.physics.newRectangleShape(objects.ground.w, objects.ground.h)
  objects.box1.fixture  = love.physics.newFixture(objects.ground.body, objects.ground.shape)

  gab.body    = love.physics.newBody(world, 10, 600 - objects.ground.h - gab.h, "dynamic")
  gab.x       = gab.body:getX()
  gab.y       = gab.body:getY()
  gab.shape   = love.physics.newRectangleShape(gab.w/2, gab.h/2, gab.w, gab.h)
  gab.fixture = love.physics.newFixture(gabriel.body, gabriel.shape, 1)
  gab.body:setMass(0.1)
end

function playground:draw()
  love.graphics.setColor(68, 68, 68)
  love.graphics.polygon("fill", objects.ground.body:getWorldPoints(objects.ground.shape:getPoints()))
  love.graphics.polygon("fill", objects.wallL.body:getWorldPoints(objects.wallL.shape:getPoints()))
  love.graphics.polygon("fill", objects.wallR.body:getWorldPoints(objects.wallR.shape:getPoints()))
  gab:draw()
end

function playground:update(dt)
  world:update(dt)
  gab.update()
end

return playground