gabriel = {
  x = 0, y = 0, w = 32, h = 64
}
velocity = {x = 0, y = 0}

function gabriel:draw()
  love.graphics.setColor(193, 47, 14)
  love.graphics.rectangle("fill", gabriel.body:getX(), gabriel.body:getY(), gabriel.w, gabriel.h)
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("Velocity X: " .. velocity.x, 10, 10)
  love.graphics.print("Velocity Y: " .. velocity.y, 10, 25)
end

function gabriel:update()
  if love.keyboard.isDown("right") then
    gabriel.body:applyForce(400, 0)
  elseif love.keyboard.isDown("left") then
    gabriel.body:applyForce(-400, 0)
  elseif love.keyboard.isDown("up") and velocity.y == 0 then
    gabriel.body:applyForce(0, -15000)
  end
  velocity.x, velocity.y = gabriel.body:getLinearVelocity()
end

return gabriel