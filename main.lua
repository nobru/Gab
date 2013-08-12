Gamestate = require "hump.gamestate"
play      = require "scene.playground"
gabriel = require "gabriel"

function love.load()
  love.graphics.setCaption('Gab The Game')
  Gamestate.registerEvents()
  Gamestate.switch(play)
  gabriel:load()
end

function love.draw()
	gabriel:draw()
end

function love.update(dt)
	dt = dt * 2
	gabriel:update(dt)
	world:update(dt)
end