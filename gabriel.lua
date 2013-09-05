local anim8 = require('lib.anim8.anim8')

local gabriel = {
  x = 0, 
  y = 0, 
  w = 30, 
  h = 44, 
  force = 300,
  isJumping = false,
  velocity = 180,
  isStarted = false,
  lastDirection = 0
}
velocity = {
  x = 0, 
  y = 0
}

function gabriel:load()
  self.body     = love.physics.newBody(world, 60, 260, "dynamic")
  self.shape    = love.physics.newRectangleShape(gabriel.w/2, gabriel.h/2-2, gabriel.w, gabriel.h)
  self.fixture  = love.physics.newFixture(gabriel.body, gabriel.shape, 1)
  self.x        = self.body:getX()
  self.y        = self.body:getY()
  self.fixture:setUserData("Gabriel")

  image = love.graphics.newImage('sprites/gab.png')
  g = anim8.newGrid(30, 44, image:getWidth(), image:getHeight())

  self.animations = {
      stopRight = anim8.newAnimation(g('1-1', 1), 0.1),
      stopLeft  = anim8.newAnimation(g('8-8', 1), 0.1),
      walkRight = anim8.newAnimation(g('1-3', 1), 0.07),
      walkLeft  = anim8.newAnimation(g('8-6', 1), 0.07),
      jumpRight = anim8.newAnimation(g('4-4', 1), 0.1),
      jumpLeft  = anim8.newAnimation(g('5-5', 1), 0.1)
  }
  self.animation = self.animations.stopRight
end

function gabriel:draw()
  love.graphics.setColor(255, 255, 255)
  self.animation:draw(image, gabriel.body:getX() + (gabriel.w/2), gabriel.body:getY() + (gabriel.h/2), 0, 1, 1, gabriel.w/2, gabriel.h/2)
  love.graphics.setColor(0, 0, 0)
end

function gabriel:update(dt)
  self.animation:update(dt)
  force = gabriel.body:getMass() * velocity.x
-- @TODO: improve jump checking to prevent double jumps
  if (velocity.y == 0) then
    self.isJumping = false
    self.body:applyLinearImpulse(0, 0)
    if (self.lastDirection < 0) then
      self.animation = self.animations.stopLeft
    else
      self.animation = self.animations.stopRight
    end
  end

  if (self.isJumping) then
    if (self.lastDirection < 0) then
      self.animation = self.animations.jumpLeft
    else
      self.animation = self.animations.jumpRight
    end
  elseif (love.keyboard.isDown("right")) then
    self.animation = self.animations.walkRight
    self.lastDirection = 1
  elseif (love.keyboard.isDown("left")) then
    self.animation = self.animations.walkLeft
    self.lastDirection = -1
  end

  if love.keyboard.isDown("right") and velocity.x < self.velocity then
    self.body:applyForce(self.force, 0)
    self.body:setFixedRotation(true)
  elseif love.keyboard.isDown("left") and velocity.x > -self.velocity then
    self.body:applyForce(-self.force, 0)
  else
      self.body:applyLinearImpulse(-velocity.x / 20, 0)
      if self.isJumping then
        self.body:applyLinearImpulse(velocity.x / 20, 0)
      end
  end
  if love.keyboard.isDown(" ") and not self.isJumping then
   self.body:applyLinearImpulse(0, -120)
   self.isJumping = true
  end
  velocity.x, velocity.y = gabriel.body:getLinearVelocity()
end

return gabriel