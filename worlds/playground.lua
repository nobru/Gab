playground = {}

function playground.load(world)
  love.physics.setMeter(50)
  love.graphics.setBackgroundColor(210, 222, 227)
  objects                 = {}
  objects.ground          = {}
  objects.ground.body     = love.physics.newBody(world, 800/2, 560)
  objects.ground.shape    = love.physics.newRectangleShape(800, 80)
  objects.ground.fixture  = love.physics.newFixture(objects.ground.body, objects.ground.shape)
end

function playground.draw()
  love.graphics.setColor(68, 68, 68)
  love.graphics.polygon("fill", objects.ground.body:getWorldPoints(objects.ground.shape:getPoints()))

  love.graphics.setColor(193, 47, 14)
  love.graphics.circle(
    "fill", 
    gabriel.player.body:getX(), 
    gabriel.player.body:getY(), 
    gabriel.player.shape:getRadius()
  )
end
