gabriel = {
  x = 0,
  y = 0
}

function gabriel.load(world)
  gabriel.player          = {}
  gabriel.player.body     = love.physics.newBody(world, 800/2, 560)
  gabriel.player.shape    = love.physics.newCircleShape(20)
  gabriel.player.fixture  = love.physics.newFixture(gabriel.player.body, gabriel.player.shape, 1)
  gabriel.player.fixture:setRestitution(1)
end

function gabriel.draw()
  love.graphics.setColor(193, 47, 14)
  love.graphics.circle(
    "fill", 
    gabriel.player.body:getX(), 
    gabriel.player.body:getY(), 
    gabriel.player.shape:getRadius()
  )
end
