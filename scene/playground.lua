gabriel = require '..gabriel'

local playground = {}

function playground:init()
  love.physics.setMeter(64)
  world = love.physics.newWorld(0, 15.81*64, true)
  love.graphics.setBackgroundColor(210, 222, 227)

  objects                 = {}
  objects.ground          = {w = 1000, h = 96}
  objects.ground.body     = love.physics.newBody(world, 1000/2, 600 - (objects.ground.h/2))
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

  -- objects.box1          = {w = 64, h = 64}
  -- objects.box1.body     = love.physics.newBody(world, 1000/2, 480)
  -- objects.box1.shape    = love.physics.newRectangleShape(objects.box1.w, objects.box1.h)
  -- objects.box1.fixture  = love.physics.newFixture(objects.box1.body, objects.box1.shape)
  -- objects.box2          = {w = 64, h = 128}
  -- objects.box2.body     = love.physics.newBody(world, 1000/2 + 64, 460)
  -- objects.box2.shape    = love.physics.newRectangleShape(objects.box2.w, objects.box2.h)
  -- objects.box2.fixture  = love.physics.newFixture(objects.box2.body, objects.box2.shape)
  -- objects.box3          = {w = 64, h = 64}
  -- objects.box3.body     = love.physics.newBody(world, 1000/2 + 128, 480)
  -- objects.box3.shape    = love.physics.newRectangleShape(objects.box1.w, objects.box1.h)
  -- objects.box3.fixture  = love.physics.newFixture(objects.box3.body, objects.box3.shape)

  gabriel:load()
end

function playground:draw()
  love.graphics.setColor(68, 68, 68)
  love.graphics.polygon("fill", objects.ground.body:getWorldPoints(objects.ground.shape:getPoints()))
  love.graphics.polygon("fill", objects.wallL.body:getWorldPoints(objects.wallL.shape:getPoints()))
  love.graphics.polygon("fill", objects.wallR.body:getWorldPoints(objects.wallR.shape:getPoints()))
  -- love.graphics.polygon("fill", objects.box1.body:getWorldPoints(objects.box1.shape:getPoints()))
  -- love.graphics.polygon("fill", objects.box2.body:getWorldPoints(objects.box2.shape:getPoints()))
  -- love.graphics.polygon("fill", objects.box3.body:getWorldPoints(objects.box3.shape:getPoints()))

  gabriel:draw()
end

function playground:update(dt)
  world:update(dt)
  gabriel:update(dt)
end

return playground