playground = require "scene.playground"
gabriel = require "gabriel"

function love.load()
	playground:init()
	gabriel:load()
end

function love.draw()
	playground:draw()
	gabriel:draw()
end

function love.update(dt)
	dt = dt * 8
	gabriel:update(dt)
	world:update(dt)
end