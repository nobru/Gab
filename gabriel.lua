local gabriel = {
    x = 0,
    y = 0,
    w = 32,
    h = 64,
    force = 300,
    speed = 200
}

local velocity = {
  x = 0,
  y = 0
}

force = 0

function gabriel:load()
    self.body = love.physics.newBody(world, 10, 600 - objects.ground.h - gabriel.h, "dynamic")
    self.shape = love.physics.newRectangleShape(gabriel.w/2, gabriel.h/2, gabriel.w, gabriel.h)
    self.fixture = love.physics.newFixture(gabriel.body, gabriel.shape, 1)
end

function gabriel:draw()
    love.graphics.setColor(193, 47, 14)
    love.graphics.rectangle("fill", gabriel.body:getX(), gabriel.body:getY(), gabriel.w, gabriel.h)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("Velocity X: " .. velocity.x, 10, 10)
    love.graphics.print("Velocity Y: " .. velocity.y, 10, 25)
    love.graphics.print("Force: " .. force, 10, 50)
end

function gabriel:update(dt)
    force = gabriel.body:getMass() * dt * gabriel.speed

    if love.keyboard.isDown("right") and force <= gabriel.force then
        gabriel.body:setX(gabriel.body:getX() + force)
    elseif love.keyboard.isDown("left") and force >= -gabriel.force then
        gabriel.body:setX((gabriel.body:getX() - force))
    end

    if love.keyboard.isDown(" ") and math.floor(velocity.y) == 0 then
        gabriel.body:applyLinearImpulse(0, -200)
    end

    velocity.x, velocity.y = gabriel.body:getLinearVelocity()
end

return gabriel