require "worlds/playground"
require "gabriel"

function love.load()
  love.graphics.setCaption('Gab The Game')
  world = love.physics.newWorld(0, 10*50, true)
  playground.load(world)
  gabriel.load(world)
end

function love.draw()
  playground.draw()
  gabriel.draw()
end

function love.update(dt)
  if love.keyboard.isDown("right") then
    gabriel.player.body:applyForce(400, 0)
  elseif love.keyboard.isDown("left") then
    gabriel.player.body:applyForce(-400, 0)
  elseif love.keyboard.isDown("up") then
    gabriel.player.body:setPosition(650/2, 650/2)
  end
end

function love.keypressed(key)
  if key == "up" then
    gabriel.y = gabriel.y - 32
  elseif key == "down" then
    gabriel.y = gabriel.y + 32
  elseif key == "left" then
    gabriel.x = gabriel.x - 32
  elseif key == "right" then
    gabriel.x = gabriel.x + 32
  end
end