local playground = {}

function playground:init()
    world = love.physics.newWorld(0, 9.8, true)
    love.graphics.setBackgroundColor(210, 222, 227)

    objects                 = {}
    objects.ground          = { w = love.graphics.getWidth(), h = 96 }
    objects.ground.body     = love.physics.newBody(world, love.graphics.getWidth()/2, love.graphics.getHeight() - (objects.ground.h/2), 'static')
    objects.ground.shape    = love.physics.newRectangleShape(objects.ground.w, objects.ground.h)
    objects.ground.fixture  = love.physics.newFixture(objects.ground.body, objects.ground.shape)

    obstacle                 = {}
    obstacle.ground          = { w = 100, h = 10 }
    obstacle.ground.body     = love.physics.newBody(world, 350, 400, 'static')
    obstacle.ground.shape    = love.physics.newRectangleShape(obstacle.ground.w, obstacle.ground.h)
    obstacle.ground.fixture  = love.physics.newFixture(obstacle.ground.body, obstacle.ground.shape)
end

function playground:draw()
    love.graphics.setColor(68, 68, 68)
    love.graphics.polygon("fill", objects.ground.body:getWorldPoints(objects.ground.shape:getPoints()))
    
    love.graphics.setColor(255, 20, 20)
    love.graphics.polygon("fill", obstacle.ground.body:getWorldPoints(obstacle.ground.shape:getPoints()))
end

return playground