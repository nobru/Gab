local gabriel = {
  x = 0, 
  y = 0, 
  w = 32, 
  h = 64, 
  force = 400,
  isJumping = false,
  velocity = 300
}
velocity = {
  x = 0, 
  y = 0
}

function gabriel:load()
  self.body     = love.physics.newBody(world, 10, 600 - objects.ground.h - gabriel.h, "dynamic")
  self.shape    = love.physics.newRectangleShape(gabriel.w/2, gabriel.h/2, gabriel.w, gabriel.h)
  self.fixture  = love.physics.newFixture(gabriel.body, gabriel.shape, 1)
  self.x        = self.body:getX()
  self.y        = self.body:getY()
  self.fixture:setUserData("Gabriel")
end

function gabriel:draw()
  love.graphics.setColor(193, 47, 14)
  love.graphics.rectangle("fill", gabriel.body:getX(), gabriel.body:getY(), gabriel.w, gabriel.h)
  love.graphics.setColor(0, 0, 0)
end

function gabriel:update(dt)
  force = gabriel.body:getMass() * velocity.x
-- @TODO: improve jump checking to prevent double jumps
  if (velocity.y == 0) then
    self.isJumping = false
    self.body:applyLinearImpulse(0, 0)
  end

  if love.keyboard.isDown("right") and velocity.x < self.velocity then
    self.body:applyForce(self.force, 0)
    self.body:setFixedRotation(true)
  elseif love.keyboard.isDown("left") and velocity.x > -self.velocity then
    self.body:applyForce(-gabriel.force, 0)
  else
    self.body:applyLinearImpulse(-velocity.x / 20, 0)
  end
  if love.keyboard.isDown("up") and not self.isJumping then
   self.body:applyLinearImpulse(0, -200)
   self.body:applyForce(velocity.x, 0)
   self.isJumping = true
  end
  velocity.x, velocity.y = gabriel.body:getLinearVelocity()
end

return gabriel